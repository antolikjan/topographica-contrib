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
"A=0,"
"A=1,SecondStageTime=1,"
"A=2,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=3,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=4,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=5,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=6,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=7,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=8,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=9,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=10,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=11,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=12,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=13,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=14,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=15,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=16,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=17,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=18,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=19,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=20,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=21,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=22,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=23,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=24,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=25,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=26,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=27,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=28,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=29,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=30,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=31,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=32,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=33,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=34,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=35,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=36,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=37,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=38,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=39,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=40,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=41,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=42,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=43,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=44,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=45,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=46,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=47,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=48,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=49,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=50,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=51,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=52,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=53,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=54,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=55,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=56,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=57,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=58,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=59,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=60,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=61,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=62,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=63,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=64,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=65,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=66,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=67,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=68,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=69,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=70,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=71,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=72,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=73,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=74,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=75,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=76,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=77,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=78,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=79,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.08,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=80,SecondStageTime=1,V1SimpleLateralStrength=0.05,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=81,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"
"A=82,SecondStageTime=1,V1SimpleLateralStrength=0.2,V1SimpleLateralRadius=0.04,V1SimpleLateralHebbLR=0.3,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4"


)
 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/push_pull/push_pull_simple_feedback.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PP1/",times=[5005,10005],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


