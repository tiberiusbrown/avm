"""Build and run the float kernels against host C99 libm, outside the guest.
Use --wsl on Windows to select glibc rather than older MinGW complex routines.
All temporary products remain under the requested build output directory.
"""
import argparse
from pathlib import Path
import subprocess
import shutil

p=argparse.ArgumentParser()
p.add_argument('--output',type=Path,required=True)
p.add_argument('--wsl',action='store_true')
a=p.parse_args()
root=Path(__file__).resolve().parents[2]
out=a.output.resolve()
out.mkdir(parents=True,exist_ok=True)
def hostpath(path):
 s=path.resolve().as_posix()
 return '/mnt/'+s[0].lower()+s[2:] if a.wsl else s
names='cacos casin catan ccos csin ctan cacosh casinh catanh ccosh csinh ctanh cexp clog cabs cpow csqrt carg cimag creal conj cproj'.split()
s='#define _GNU_SOURCE\n'
for n in names:s+=f'#define {n}f avm_{n}f\n'
for n in 'basic exp_log sqrt pow trig hyperbolic inverse'.split():
 s+=f'#include "{hostpath(root/"runtime/lib/complex"/(n+".c"))}"\n'
source=out/'kernels.c'
source.write_text(s)
exe=out/('reference' if a.wsl else 'reference.exe' if __import__('os').name=='nt' else 'reference')
cc=['wsl','--exec','cc'] if a.wsl else [shutil.which('cc') or 'gcc']
subprocess.run(cc+['-std=c99','-O2','-g','-ffp-contract=off',hostpath(root/'tests/math/complex_reference.c'),hostpath(source),'-lm','-o',hostpath(exe)],check=True)
run=['wsl','--exec',hostpath(exe)] if a.wsl else [str(exe)]
result=subprocess.run(run,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
(out/'results.txt').write_text(result.stdout)
print(result.stdout,end='')
raise SystemExit(result.returncode)
