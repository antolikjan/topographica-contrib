#!/bin/bash
#$ -cwd -V
#$ -l h_rt=43:59:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 4
#$ -N cc_lissom_pp
source ./virt_envs/topo/bin/activate
echo 'starting'
argsprefix=""

let "a=RANDOM/1600"
sleep $a

arguments=(
"A=0,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=False,analysis_scale=1.0"
"A=1,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=1.0"
"A=2,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3,Inbalance=0.2"
"A=3,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3,Inbalance=0.3"
"A=4,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=5,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.3,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=6,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.5,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=7,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.005,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=8,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.007,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=9,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=10,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.011,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=11,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.15,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=12,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.13,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=13,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.21,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=14,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.19,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=15,BasedOn='CCLISSOMPP26|A16',ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=16,BasedOn='CCLISSOMPP26|A16',ImageScale=0.4,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=17,BasedOn='CCLISSOMPP26|A16',ImageScale=0.45,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=18,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.7,SIIStr=-4.7,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=19,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-5.2,SIIStr=-5.2,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=20,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.3,SIIStr=-4.3,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"
"A=21,BasedOn='CCLISSOMPP26|A16',ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.006,MUI=0.009,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.5,SIEStr=-4.9,SIIStr=-4.9,CEFeedback=0.14,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,AHRule=True,analysis_scale=0.3"









)
 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/CCLISSOM_push_pull.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/CCLISSOMPPNEW7/",times=[5005,10005],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


