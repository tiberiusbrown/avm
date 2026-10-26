"""Time a complete incremental build and validation workflow.

Run in the configured compiler developer environment. Logs are streamed so
compiler and test diagnostics remain intact. Reports default to build/.
"""
import argparse
import json
from pathlib import Path
import subprocess
import time

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--profile',choices=['fast','math-full','full','bench'],default='fast')
    p.add_argument('--build',type=Path,default=Path('build'))
    p.add_argument('--parallel',type=int,default=8)
    args=p.parse_args()
    targets={'fast':'avm_math_fast','math-full':'avm_math_full',
             'full':'avm_validation_full','bench':'avm_trig_bench_run'}
    start=time.perf_counter()
    result=subprocess.run(['cmake','--build',str(args.build),'--config','RelWithDebInfo',
                           '--target',targets[args.profile],'--parallel',str(args.parallel)])
    report=dict(profile=args.profile,target=targets[args.profile],
                elapsed_seconds=time.perf_counter()-start,exit_code=result.returncode)
    path=args.build/('math-profile-'+args.profile+'.json')
    path.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report),flush=True)
    raise SystemExit(result.returncode)

if __name__=='__main__': main()
