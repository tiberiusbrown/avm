"""Summarize matched reducer cycles and the optional instruction-stepped trace.

Trace PCs use the same AVM boundary convention as the debugger. Counts include
the caller. No static instruction costs are substituted for AVR cycle timing.
"""
import argparse
from collections import Counter, defaultdict
import json
import os
from pathlib import Path
import re
import subprocess

def cycles(path):
    return {row.split()[1].removesuffix('.c'):int(row.split()[0])
            for row in path.read_text().splitlines() if row.strip()}

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory',type=Path)
    p.add_argument('--images',type=Path,default=Path('build/bench/c'))
    p.add_argument('--build',type=Path,default=Path('build'))
    args=p.parse_args()
    measurements=cycles(args.directory/'cycles.txt')
    report={'calls_per_workload':32,'categories':{}}
    prefix='math_trig_probe_'
    for name,total in measurements.items():
        if not name.startswith(prefix+'outline_'): continue
        domain=name.removeprefix(prefix+'outline_')
        v={kind:measurements[prefix+kind+'_'+domain]/32
           for kind in ['loop','identity','outline','inline']}
        v['outline_net']=v['outline']-v['identity']
        v['inline_net']=v['inline']-v['loop']
        report['categories'][domain]=v
    trace=args.directory/'trace.tsv'
    if trace.exists():
        entries=defaultdict(Counter)
        for row in trace.read_text().splitlines()[1:]:
            name,pc,count=row.split('\t'); entries[name][int(pc)]+=int(count)
        dynamic={}
        for name,pc_counts in entries.items():
            if not (args.images/(name+'.elf')).exists():
                dynamic[name]={'skipped':'linked ELF not archived','instructions':{},'unmatched':[]}
                continue
            tool=args.build/'llvm-build/bin'/('llvm-objdump'+('.exe' if os.name=='nt' else ''))
            asm=subprocess.check_output([str(tool),'-d',str(args.images/(name+'.elf'))],text=True)
            instructions={int(m[1],16):m[2] for m in re.finditer(r'^\s*([0-9a-f]+):\s+(?:[0-9a-f]{2}\s+)+([a-z][\w.]*)',asm,re.M)}
            count=Counter(); unmatched=[]
            for pc,n in pc_counts.items():
                if pc in instructions: count[instructions[pc]]+=n
                else: unmatched.append([pc,n])
            dynamic[name]={'instructions':dict(count),'unmatched':unmatched}
        report['dynamic']=dynamic
    (args.directory/'analysis.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report['categories'],indent=2))
    if 'dynamic' in report:
        missing=sum(sum(n for pc,n in v['unmatched']) for v in report['dynamic'].values())
        print(f'Unmatched traced instruction executions: {missing}')

if __name__=='__main__': main()
