#!/bin/bash
#$ -cwd -V
#$ -l h_rt=43:59:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 4
#$ -N cc_lissom_pp
source ./virt_envs/topo/bin/activate
echo 'starting'
argsprefix="analysis_scale=1.0,"

let "a=RANDOM/1600"
sleep $a

arguments=(
"A=0,BasedOn='CCLISSOMPP26|A16',ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0"

)
 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/CCLISSOM_push_pull.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/CCLISSOMPPNEW22/",times=[10005,20000],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


