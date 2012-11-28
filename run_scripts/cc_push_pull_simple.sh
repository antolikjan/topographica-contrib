#!/bin/bash
#$ -cwd -V
#$ -l h_rt=5:00:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 1
#$ -N cc_lissom_pp
echo 'starting'
argsprefix="analysis_scale=0.3,"

let "a=RANDOM/1600"
sleep $a

arguments=(
"A=1,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=2,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=3,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=4,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=5,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=6,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=7,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=8,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=9,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=10,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=11,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=12,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=13,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=14,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=15,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=16,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=17,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=18,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=19,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=20,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=21,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=22,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=23,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=24,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=25,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=26,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=27,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=28,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=29,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=30,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=31,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=32,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=33,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=34,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=35,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=36,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=37,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=38,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=39,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=40,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=41,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=42,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=43,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=44,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=45,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=46,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=47,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=48,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=49,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=50,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=51,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=52,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=53,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=54,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=55,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=56,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=57,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=58,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=59,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=60,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=61,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=62,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=63,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=64,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=65,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=66,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=67,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=68,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=69,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=70,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=71,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=72,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=73,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=74,CS=0.05,ImageScale=0.35,AFF_lr=0.5,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=75,CS=0.05,ImageScale=0.45,AFF_lr=0.5,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=76,CS=0.05,ImageScale=0.25,AFF_lr=0.3,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=77,CS=0.05,ImageScale=0.35,AFF_lr=0.3,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=78,CS=0.05,ImageScale=0.45,AFF_lr=0.3,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=79,CS=0.05,ImageScale=0.25,AFF_lr=0.7,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=80,CS=0.05,ImageScale=0.35,AFF_lr=0.7,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=81,CS=0.05,ImageScale=0.45,AFF_lr=0.7,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=82,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=5.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=83,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=3.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=84,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.2,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=85,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.05,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=86,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.5,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=87,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=0.5,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=88,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.5,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=89,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-1.5,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=90,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.5,Inbalance=0.0,reset_period=40,SS=1"
"A=91,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-0.5,Inbalance=0.0,reset_period=40,SS=1"
"A=92,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=20,SS=1"
"A=93,CS=0.05,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=160,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=1,SS=1"
)

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/push_pull_simple.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PPS01/",times=[5000,10007],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=1 -c "${a}"


