"""Selection regressions: missing unselected images, listing and safe outputs."""
import argparse
import hashlib
import os
from pathlib import Path
import subprocess
import tempfile

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--build',type=Path,default=Path('build'))
    args=p.parse_args()
    build=args.build.resolve()
    suffix='.exe' if os.name=='nt' else ''
    def run(runner,*options,success=True):
        result=subprocess.run([str(build/(runner+suffix)),*map(str,options)],text=True,capture_output=True)
        assert (result.returncode==0)==success, result.stdout+result.stderr
        return result.stdout+result.stderr
    with tempfile.TemporaryDirectory(dir=build) as tmp:
        tmp=Path(tmp)
        for lang,extension in [('asm','.asm'),('c','.c'),('cpp','.cpp')]:
            (tmp/lang).mkdir()
            (tmp/lang/('unbuilt'+extension)).write_text('')
        (tmp/'c/math_sinf.c').write_text('')
        dirs=['--asm-dir',tmp/'asm','--c-dir',tmp/'c','--cpp-dir',tmp/'cpp',
              '--bin-dir',tmp/'missing-asm','--c-bin-dir',tmp/'missing-c',
              '--cpp-bin-dir',tmp/'missing-cpp','--interpreter',tmp/'missing.hex']
        out=run('avm_tests',*dirs,'--filter','^math_(sin|cos)f$','--opt','O2,O0,O2','--list')
        assert out.splitlines()==['[C   O0] math_sinf.c','[C   O2] math_sinf.c'],repr(out)
        out=run('avm_tests',*dirs,'--filter','unbuilt','--opt','O0','--list')
        assert out.count('[ASM]')==1 and len(out.splitlines())==3,out
        assert 'No tests match' in run('avm_tests',*dirs,'--filter','absent','--list',success=False)
        run('avm_tests','--filter','[','--list',success=False)
        run('avm_tests','--opt','O4','--list',success=False)
        run('avm_tests','--opt','O0,','--list',success=False)
        benchdirs=['--c-only','--c-source-dir',tmp/'c','--c-image-dir',tmp/'missing',
                   '--interpreter',tmp/'missing.hex']
        out=run('avm_bench',*benchdirs,'--filter','^math_sinf$','--list')
        assert out.strip()=='[C O2] math_sinf',out
        assert 'No benchmarks match' in run('avm_bench',*benchdirs,'--filter','absent','--list',success=False)
        # Run an actual selected image with an unbuilt peer in its source dir.
        for name in ['math_sin','math_cos']:
            (tmp/('c/'+name+'.c')).write_text('')
        committed=Path(__file__).resolve().parents[1]/'bench/cycles_c.txt'
        before=hashlib.sha256(committed.read_bytes()).digest()
        run('avm_bench','--c-only','--c-source-dir',tmp/'c','--c-image-dir',build/'bench/c',
            '--filter','^math_sin$','--c-output',tmp/'cycles.txt')
        assert 'math_sin.c' in (tmp/'cycles.txt').read_text()
        assert before==hashlib.sha256(committed.read_bytes()).digest()
        # A reused sequential emulator must give the same cycles as isolated
        # one-image sessions (including different FX image contents).
        run('avm_bench','--c-only','--c-source-dir',tmp/'c','--c-image-dir',build/'bench/c',
            '--filter','^math_(sin|cos)$','--c-output',tmp/'paired.txt')
        paired=dict((line.split()[1],line.split()[0]) for line in (tmp/'paired.txt').read_text().splitlines())
        for name in ['math_sin','math_cos']:
            run('avm_bench','--c-only','--c-source-dir',tmp/'c','--c-image-dir',build/'bench/c',
                '--filter','^'+name+'$','--c-output',tmp/'single.txt')
            row=(tmp/'single.txt').read_text().split()
            assert paired[row[1]]==row[0], (name,paired,row)
    print('Runner selection, missing-image and partial-output regressions passed.')

if __name__=='__main__': main()
