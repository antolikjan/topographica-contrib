#!/bin/bash
#$ -cwd -V
#$ -l h_rt=43:59:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 4
#$ -N cc_lissom_pp
echo 'starting'
argsprefix="analysis_scale=0.3,"

let "a=RANDOM/1600"
sleep $a

arguments=(
"A=1,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=2,ImageScale=0.3,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=3,ImageScale=0.4,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"          
"A=4,ImageScale=0.35,AFF_lr=0.3,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=5,ImageScale=0.35,AFF_lr=0.5,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=6,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.5,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=7,ImageScale=0.35,AFF_lr=0.4,StoCStr=3.5,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=8,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.014,MUI=0.014,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=9,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.016,MUI=0.016,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=10,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.018,MUI=0.018,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=11,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=3.5,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=12,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4.5,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=13,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.0,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=14,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.3,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=15,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.6,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=16,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.0,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=17,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.3,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=18,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.6,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.2,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=19,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.0,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.22,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=20,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.3,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.22,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=21,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-6.6,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.22,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=22,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.6,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=23,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=3.0,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.3"
"A=24,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=1.8,StoCSize=0.2,Inbalance=0.3"
"A=25,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.2,StoCSize=0.2,Inbalance=0.3"
"A=26,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.1,Inbalance=0.3"
"A=27,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.3,Inbalance=0.3"
"A=28,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.1"
"A=29,ImageScale=0.35,AFF_lr=0.4,StoCStr=4.0,MUE=0.012,MUI=0.012,SETAE=0.004,SETAI=0.002,default_density=96,LGNStr=4,SEEStr=1.0,SEIStr=0.4,SIEStr=-5.7,SIIStr=-5.7,CEFeedback=0.18,CIFeedback=0.18,SEElr=0.0,SEIlr=0.0,SIElr=0.0,SIIlr=0.0,CCStrInh=2.8,CCStrExc=2.0,StoCSize=0.2,Inbalance=0.5") 
args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/CCLISSOM_push_pull.ty",analysis_fn=contrib.jaanalysis.complex_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/CCLISSOMPP28/",times=[5006,5007,10004,10005],snapshot=False,dirname_prefix='
a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


