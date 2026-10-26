"""Selection regressions: missing unselected images, listing and safe outputs."""
import argparse
import hashlib
import os
import re
import shutil
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
        for runner in ['avm_tests', 'avm_bench']:
            for jobs in ['0', '-1', '+2', '1x', '', '999999999999999999999999999999']:
                assert '--jobs' in run(runner, '--jobs', jobs, '--list', success=False)
            run(runner, '--jobs', success=False)
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
        run('avm_bench','--c-only','--c-source-dir',tmp/'c','--c-image-dir',build/'bench/c',
            '--filter','^math_sin$','--c-output',tmp/'traced.txt','--trace-output',tmp/'trace.tsv')
        assert (tmp/'traced.txt').read_text()==(tmp/'cycles.txt').read_text()
        trace=(tmp/'trace.tsv').read_text().splitlines()
        assert trace[0]=='benchmark\tpc\texecutions' and len(trace)>1
        assert all(int(row.split('\t')[2])>0 for row in trace[1:])
        # A reused sequential emulator must give the same cycles as isolated
        # one-image sessions (including different FX image contents).
        run('avm_bench','--c-only','--c-source-dir',tmp/'c','--c-image-dir',build/'bench/c',
            '--filter','^math_(sin|cos)$','--jobs',1,'--c-output',tmp/'paired.txt')
        paired=dict((line.split()[1],line.split()[0]) for line in (tmp/'paired.txt').read_text().splitlines())
        for name in ['math_sin','math_cos']:
            run('avm_bench','--c-only','--c-source-dir',tmp/'c','--c-image-dir',build/'bench/c',
                '--filter','^'+name+'$','--c-output',tmp/'single.txt')
            row=(tmp/'single.txt').read_text().split()
            assert paired[row[1]]==row[0], (name,paired,row)
        # Multiple workers must preserve cycles, stack measurements and trace
        # order, including when each worker reuses a session for several cases.
        for name in ['extra_a', 'extra_b']:
            (tmp/('c/'+name+'.c')).write_text('')
            shutil.copyfile(build/'bench/c/math_sin.bin', tmp/(name+'.bin'))
        for name in ['math_sin', 'math_cos']:
            shutil.copyfile(build/('bench/c/'+name+'.bin'), tmp/(name+'.bin'))
        outputs=[]
        for jobs in [1, 2, 999, None]:
            prefix=tmp/('jobs-'+str(jobs))
            options=[] if jobs is None else ['--jobs', jobs]
            out=run('avm_bench', '--c-only', '--c-source-dir', tmp/'c', '--c-image-dir', tmp,
                '--filter', '^(math_(sin|cos)|extra_[ab])$', *options,
                '--c-output', str(prefix)+'.txt', '--stack-output', str(prefix)+'.stack',
                '--trace-output', str(prefix)+'.trace')
            if jobs is not None:
                assert 'workers:     '+str(min(jobs,4)) in out, out
            outputs.append(tuple(Path(str(prefix)+ext).read_bytes() for ext in ['.txt','.stack','.trace']))
        assert all(result==outputs[0] for result in outputs), 'Parallel benchmark results differ'
        # Exercise passing and failing test cases without modifying real fixtures.
        (tmp/'O2').mkdir()
        for name in ['extra_a', 'extra_b', 'math_sin', 'math_cos']:
            shutil.copyfile(build/'tests/c/O2/affine_store_values.bin', tmp/('O2/'+name+'.bin'))
            shutil.copyfile(Path(__file__).parent/'c/affine_store_values_output.txt',
                            tmp/('c/'+name+'_output.txt'))
        test_options=['--asm-dir', tmp/'asm', '--c-dir', tmp/'c', '--cpp-dir', tmp/'cpp',
                      '--c-bin-dir', tmp, '--opt', 'O2', '--verbose',
                      '--filter', '^(math_(sin|cos)|extra_[ab])$']
        def normalized(text):
            text=re.sub(r'with \d+ worker\(s\)', 'with WORKERS', text)
            return '\n'.join(line for line in text.splitlines() if not line.startswith('Elapsed wall time:'))
        for failure in [False, True]:
            if failure:
                (tmp/'c/extra_a_output.txt').write_text('deliberately wrong output')
                (tmp/'O2/math_cos.bin').unlink()
            serial=normalized(run('avm_tests', *test_options, '--jobs', 1, success=not failure))
            for jobs in [2, 999, None]:
                options=[] if jobs is None else ['--jobs', jobs]
                parallel=normalized(run('avm_tests', *test_options, *options, success=not failure))
                assert serial==parallel, (serial, parallel)
            if failure:
                assert (tmp/'O2/extra_a_actual.txt').exists()
    print('Runner selection, parallel execution, missing-image and output regressions passed.')

if __name__=='__main__': main()
