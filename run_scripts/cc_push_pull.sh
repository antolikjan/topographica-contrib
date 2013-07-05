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
"A=2,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=3,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=4,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=5,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=6,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.6,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=7,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.6,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=8,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.6,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=9,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.6,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=10,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.3,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=11,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.3,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=12,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.3,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=13,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.3,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=14,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.2,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=15,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.2,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=16,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.2,HOMEO_ETA=0.000002,anaysis_scale=2.0"
"A=17,SecondStageTime=1,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=8,JitterMagnitude=0.2,HOMEO_ETA=0.000002,anaysis_scale=2.0")
"A=18,ONOFRandomizationMagnitude=0.0"
"A=19,SecondStageTime=1,V1SimpleLateralRadius=0.08"
"A=20,SecondStageTime=1,V1SimpleLateralRadius=0.05"
"A=21,SecondStageTime=1,V1SimpleLateralRadius=0.08,InhGain=4.0"
"A=22,SecondStageTime=1,V1SimpleLateralRadius=0.05,InhGain=4.0"

 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/push_pull/push_pull_simple_feedback.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PP333/",times=[5005,10005],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


