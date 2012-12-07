#!/bin/bash
#$ -cwd -V
#$ -l h_rt=43:59:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 4
#$ -N cc_lissom_pp
echo 'starting'
argsprefix="analysis_scale=1.0,"

let "a=RANDOM/1600"
sleep $a

arguments=(
"A=0,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.1,SEIlr=0.1,SIElr=0.1,SIIlr=0.1,AHRule=True"
"A=1,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.05,SEIlr=0.05,SIElr=0.05,SIIlr=0.05,AHRule=True"
"A=2,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.2,SEIlr=0.2,SIElr=0.2,SIIlr=0.2,AHRule=True"
"A=3,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.3,SEIlr=0.3,SIElr=0.3,SIIlr=0.3,AHRule=True"
"A=4,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.4,SEIlr=0.4,SIElr=0.4,SIIlr=0.4,AHRule=True"
"A=5,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.5,SEIlr=0.5,SIElr=0.5,SIIlr=0.5,AHRule=True"
"A=6,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.008,SETAE=0.002,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.7,SIEStr=-5.3,SIIStr=-5.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.6,SEIlr=0.6,SIElr=0.6,SIIlr=0.6,AHRule=True"
)
 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/CCLISSOM_push_pull.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/CCLISSOMPP32/",times=[5001,10006,10007],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


