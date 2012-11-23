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
"A=1,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=2,ImageScale=0.35,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=3,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=4,ImageScale=0.25,AFF_lr=0.3,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=5,ImageScale=0.35,AFF_lr=0.3,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=6,ImageScale=0.45,AFF_lr=0.3,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=7,ImageScale=0.25,AFF_lr=0.7,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=8,ImageScale=0.35,AFF_lr=0.7,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=9,ImageScale=0.45,AFF_lr=0.7,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=10,ImageScale=0.25,AFF_lr=0.5,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=11,ImageScale=0.35,AFF_lr=0.5,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=12,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=13,ImageScale=0.25,AFF_lr=0.3,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=14,ImageScale=0.35,AFF_lr=0.3,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=15,ImageScale=0.45,AFF_lr=0.3,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=16,ImageScale=0.25,AFF_lr=0.7,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=17,ImageScale=0.35,AFF_lr=0.7,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=18,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=19,ImageScale=0.25,AFF_lr=0.5,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=20,ImageScale=0.35,AFF_lr=0.5,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=21,ImageScale=0.45,AFF_lr=0.5,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=22,ImageScale=0.25,AFF_lr=0.3,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=23,ImageScale=0.35,AFF_lr=0.3,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=24,ImageScale=0.45,AFF_lr=0.3,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=25,ImageScale=0.25,AFF_lr=0.7,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=26,ImageScale=0.35,AFF_lr=0.7,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=27,ImageScale=0.45,AFF_lr=0.7,MUE=0.05,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=28,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=29,ImageScale=0.35,AFF_lr=0.5,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=30,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=31,ImageScale=0.25,AFF_lr=0.3,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=32,ImageScale=0.35,AFF_lr=0.3,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=33,ImageScale=0.45,AFF_lr=0.3,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=34,ImageScale=0.25,AFF_lr=0.7,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=35,ImageScale=0.35,AFF_lr=0.7,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=36,ImageScale=0.45,AFF_lr=0.7,MUE=0.03,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=37,ImageScale=0.25,AFF_lr=0.5,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=38,ImageScale=0.35,AFF_lr=0.5,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=39,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=40,ImageScale=0.25,AFF_lr=0.3,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=41,ImageScale=0.35,AFF_lr=0.3,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=42,ImageScale=0.45,AFF_lr=0.3,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=43,ImageScale=0.25,AFF_lr=0.7,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=44,ImageScale=0.35,AFF_lr=0.7,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=45,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=46,ImageScale=0.25,AFF_lr=0.5,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=47,ImageScale=0.35,AFF_lr=0.5,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=48,ImageScale=0.45,AFF_lr=0.5,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=49,ImageScale=0.25,AFF_lr=0.3,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=50,ImageScale=0.35,AFF_lr=0.3,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=51,ImageScale=0.45,AFF_lr=0.3,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=52,ImageScale=0.25,AFF_lr=0.7,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=53,ImageScale=0.35,AFF_lr=0.7,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=54,ImageScale=0.45,AFF_lr=0.7,MUE=0.05,MUI=0.05,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=55,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=56,ImageScale=0.35,AFF_lr=0.5,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=57,ImageScale=0.45,AFF_lr=0.5,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=58,ImageScale=0.25,AFF_lr=0.3,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=59,ImageScale=0.35,AFF_lr=0.3,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=60,ImageScale=0.45,AFF_lr=0.3,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=61,ImageScale=0.25,AFF_lr=0.7,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=62,ImageScale=0.35,AFF_lr=0.7,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=63,ImageScale=0.45,AFF_lr=0.7,MUE=0.03,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=64,ImageScale=0.25,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=65,ImageScale=0.35,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=66,ImageScale=0.45,AFF_lr=0.5,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=67,ImageScale=0.25,AFF_lr=0.3,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=68,ImageScale=0.35,AFF_lr=0.3,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=69,ImageScale=0.45,AFF_lr=0.3,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=70,ImageScale=0.25,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=71,ImageScale=0.35,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=72,ImageScale=0.45,AFF_lr=0.7,MUE=0.01,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=73,ImageScale=0.25,AFF_lr=0.5,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=74,ImageScale=0.35,AFF_lr=0.5,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=75,ImageScale=0.45,AFF_lr=0.5,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=76,ImageScale=0.25,AFF_lr=0.3,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=77,ImageScale=0.35,AFF_lr=0.3,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=78,ImageScale=0.45,AFF_lr=0.3,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=79,ImageScale=0.25,AFF_lr=0.7,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=80,ImageScale=0.35,AFF_lr=0.7,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=81,ImageScale=0.45,AFF_lr=0.7,MUE=0.05,MUI=0.01,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=82,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=5.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=83,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=3.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=84,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.2,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=85,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.05,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=86,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.5,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=87,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=0.5,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=88,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.5,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=89,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-1.5,SIIStr=-1.0,Inbalance=0.3,reset_period=40,SS=1"
"A=90,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.5,Inbalance=0.3,reset_period=40,SS=1"
"A=91,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-0.5,Inbalance=0.3,reset_period=40,SS=1"
"A=92,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.4,reset_period=40,SS=1"
"A=93,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.1,reset_period=40,SS=1"
"A=94,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.0,reset_period=40,SS=1"
"A=95,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=20,SS=1"
"A=96,ImageScale=0.25,AFF_lr=0.5,MUE=0.03,MUI=0.03,SETAE=0.004,SETAI=0.002,default_density=30,LGNStr=4.5,SEEStr=0.1,SEIStr=1.0,SIEStr=-2.0,SIIStr=-1.0,Inbalance=0.3,reset_period=1,SS=1"
)

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/cc_push_pull.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PPS01/",times=[5000,10007],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


