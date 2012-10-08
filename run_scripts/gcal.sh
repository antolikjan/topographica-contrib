#!/bin/bash -i
#$ -S /bin/bash
#$ -cwd 


argsprefix=""

echo $argsprefix
let "a=RANDOM/160"
sleep $a

arguments=("default_density=96.0")

       
args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/examples/gcal.ty",analysis_fn=contrib.jaanalysis.t_function,output_directory="/exports/home/s0570140/go_new/RESULTS/GCAL/",times=[105],snapshot=False,dirname_prefix='
a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"

