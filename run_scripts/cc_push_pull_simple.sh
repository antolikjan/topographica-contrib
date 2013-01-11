#!/bin/bash
#$ -cwd -V
#$ -l h_rt=5:00:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 1
#$ -N cc_lissom_pp
echo 'starting'
argsprefix="analysis_scale=0.3,"
source ./virt_envs/topo/bin/activate
let "a=RANDOM/1600"
sleep $a

arguments=(
"A=1,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=2,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.007,MUI=0.007,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=3,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.005,MUI=0.007,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=4,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.015,MUI=0.007,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=5,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.007,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=6,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.007,MUI=0.005,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=7,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.005,MUI=0.005,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=8,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.015,MUI=0.005,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=9,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.005,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=10,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.007,MUI=0.015,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=11,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.005,MUI=0.015,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=12,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.015,MUI=0.015,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=13,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.015,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=14,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.007,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=15,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.005,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=16,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.015,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=17,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=18,CS=0.05,ImageScale=0.55,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=19,CS=0.05,ImageScale=0.65,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=20,CS=0.05,ImageScale=0.45,AFF_lr=0.2,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=21,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=22,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=5.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=23,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=3.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=24,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.2,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=25,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.05,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=26,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.5,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=27,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=0.5,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=28,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.5,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=29,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-1.5,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=30,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.5,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=31,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-0.5,Inbalance=0.0,reset_period=40,SS=1,PP_lr=0.03"
"A=32,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=20,SS=1,PP_lr=0.03"
"A=33,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=1,SS=1,PP_lr=0.03"
"A=34,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=1,SS=1,PP_lr=0.5")

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/push_pull_simple.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PPS06/",times=[5000,10007],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=1 -c "${a}"


