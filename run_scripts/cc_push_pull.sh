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
"A=2,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002"
"A=3,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002"
"A=4,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002"
"A=5,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.4,HOMEO_ETA=0.002"
"A=6,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.6,HOMEO_ETA=0.002"
"A=7,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.6,HOMEO_ETA=0.002"
"A=8,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.6,HOMEO_ETA=0.002"
"A=9,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.6,HOMEO_ETA=0.002"
"A=10,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.3,HOMEO_ETA=0.002"
"A=11,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.3,HOMEO_ETA=0.002"
"A=12,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.3,HOMEO_ETA=0.002"
"A=13,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.3,HOMEO_ETA=0.002"
"A=14,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.2,HOMEO_ETA=0.002"
"A=15,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.2,HOMEO_ETA=0.002"
"A=16,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.2,HOMEO_ETA=0.002"
"A=17,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.2,HOMEO_ETA=0.002"
"A=18,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.02"
"A=19,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.02"
"A=20,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.02"
"A=21,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.4,HOMEO_ETA=0.02"
"A=22,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.6,HOMEO_ETA=0.02"
"A=23,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.6,HOMEO_ETA=0.02"
"A=24,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.6,HOMEO_ETA=0.02"
"A=25,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.6,HOMEO_ETA=0.02"
"A=26,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.3,HOMEO_ETA=0.02"
"A=27,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.3,HOMEO_ETA=0.02"
"A=28,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.3,HOMEO_ETA=0.02"
"A=29,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.3,HOMEO_ETA=0.02"
"A=30,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.2,HOMEO_ETA=0.02"
"A=31,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.2,HOMEO_ETA=0.02"
"A=32,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.2,HOMEO_ETA=0.02"
"A=33,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.2,HOMEO_ETA=0.02"
"A=34,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.0002"
"A=35,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.0002"
"A=36,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.0002"
"A=37,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.4,HOMEO_ETA=0.0002"
"A=38,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.6,HOMEO_ETA=0.0002"
"A=39,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.6,HOMEO_ETA=0.0002"
"A=40,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.6,HOMEO_ETA=0.0002"
"A=41,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.6,HOMEO_ETA=0.0002"
"A=42,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.3,HOMEO_ETA=0.0002"
"A=43,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.3,HOMEO_ETA=0.0002"
"A=44,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.3,HOMEO_ETA=0.0002"
"A=45,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.3,HOMEO_ETA=0.0002"
"A=46,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.2,HOMEO_ETA=0.0002"
"A=47,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.2,HOMEO_ETA=0.0002"
"A=48,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.2,HOMEO_ETA=0.0002"
"A=49,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.2,HOMEO_ETA=0.0002"
"A=50,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002"
"A=51,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002"
"A=52,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002"
"A=53,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.4,HOMEO_ETA=0.000002"
"A=54,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.6,HOMEO_ETA=0.000002"
"A=55,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.6,HOMEO_ETA=0.000002"
"A=56,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.6,HOMEO_ETA=0.000002"
"A=57,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.6,HOMEO_ETA=0.000002"
"A=58,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.3,HOMEO_ETA=0.000002"
"A=59,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.3,HOMEO_ETA=0.000002"
"A=60,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.3,HOMEO_ETA=0.000002"
"A=61,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.3,HOMEO_ETA=0.000002"
"A=62,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.2,HOMEO_ETA=0.000002"
"A=63,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.2,HOMEO_ETA=0.000002"
"A=64,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.2,HOMEO_ETA=0.000002"
"A=65,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.2,HOMEO_ETA=0.000002")
 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/push_pull/push_pull_simple_feedback.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PP333/",times=[5005,10005],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


