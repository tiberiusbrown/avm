"""Capture actual trig object, table, instruction and linked-image resources."""
import argparse
from collections import Counter
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--build',type=Path,default=Path('build'))
    p.add_argument('--objects',type=Path)
    p.add_argument('--images',type=Path)
    p.add_argument('--output',type=Path,required=True)
    args=p.parse_args()
    objects=args.objects or args.build/'runtime/objects'
    suffix='.exe' if os.name=='nt' else ''
    tools=args.build/'llvm-build/bin'
    report={}
    for name in ['ef_rem_pio2','kf_rem_pio2','sf_sin','sf_cos','sf_tan','sf_sincos']:
        path=objects/('math_'+name+'.o')
        symbols=subprocess.check_output([str(tools/('llvm-nm'+suffix)),'-S','--defined-only',str(path)],text=True)
        asm=subprocess.check_output([str(tools/('llvm-objdump'+suffix)),'-dr',str(path)],text=True)
        counts=Counter(re.findall(r'^\s*[0-9a-f]+:\s+(?:[0-9a-f]{2}\s+)+([a-z][a-z0-9_.]*)(?=\s|$)',asm,re.M))
        sizes={}
        for row in symbols.splitlines():
            fields=row.split()
            if len(fields)==4: sizes[fields[3]]=dict(bytes=int(fields[1],16),type=fields[2])
        functions={n:Counter() for n,v in sizes.items() if v['type'] in ['T','t']}
        active=None
        for line in asm.splitlines():
            if line.startswith('Disassembly of section '): active=None
            label=re.match(r'^[0-9a-f]+ <([^>]+)>:',line)
            if label and label[1] in functions: active=label[1]
            instruction=re.match(r'^\s*[0-9a-f]+:\s+(?:[0-9a-f]{2}\s+)+([a-z][a-z0-9_.]*)(?=\s|$)',line)
            if instruction and active: functions[active][instruction[1]]+=1
        if sum(sum(c.values()) for c in functions.values())!=sum(counts.values()):
            raise RuntimeError(f'Unattributed instructions in {path}')
        report[name]=dict(symbols=symbols,sizes=sizes,instructions=dict(counts),
                          function_instructions={n:dict(c) for n,c in functions.items()})
    # Archived objects must not be paired with today's rebuilt images.
    images=args.images or (None if args.objects else args.build/'bench/c')
    report['image_bytes']={} if images is None else {p.stem:p.stat().st_size for p in sorted(images.glob('math_trig*.bin'))}
    interpreter=Path('interp/build/interp.hex').read_bytes()
    report['interpreter_sha256']=hashlib.sha256(interpreter).hexdigest()
    report['interpreter_hex_data_bytes']=sum(int(line[1:3],16) for line in interpreter.decode().splitlines()
                                            if line.startswith(':') and line[7:9]=='00')
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,indent=2)+'\n')
    print(args.output)

if __name__=='__main__': main()
