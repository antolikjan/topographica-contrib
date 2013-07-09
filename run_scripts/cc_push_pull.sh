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
"A=1,ONOFRandomizationMagnitude=0.0,V1SimpleLateralRadius=0.08,"
"A=2,ONOFRandomizationMagnitude=0.0,V1SimpleLateralRadius=0.05,"
"A=3,ONOFRandomizationMagnitude=0.0,V1SimpleLateralRadius=0.03,"
"A=4,ONOFRandomizationMagnitude=0.0,V1SimpleLateralRadius=0.08,InhGain=4.0,"
"A=5,ONOFRandomizationMagnitude=0.0,V1SimpleLateralRadius=0.05,InhGain=4.0,"
"A=6,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=7,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=8,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=9,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=10,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=11,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=12,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=13,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=14,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=15,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=16,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=17,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=18,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=19,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=20,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=21,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=23,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=24,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=25,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=26,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=27,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=28,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=29,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=31,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=32,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=33,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=34,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.000002,anaysis_scale=0.5,"
"A=35,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=36,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=37,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=38,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=39,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=40,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=41,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=42,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=43,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=60,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=44,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=45,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=46,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=47,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=48,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=49,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=50,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=51,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=52,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=30,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=53,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=54,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=55,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.5,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=56,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=57,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=58,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=1.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=59,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.05,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=61,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.1,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"
"A=62,ONOFRandomizationMagnitude=0.0,V1SimpleLateralStrength=0.15,V1SimpleLateralRadius=0.12,V1SimpleLateralHebbLR=0.2,V1SimpleLateralAntiHebbLR=2.0,InhGain=3.0,ResetPeriod=15,JitterMagnitude=0.4,HOMEO_ETA=0.002,anaysis_scale=0.5,"


)

 

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/push_pull/push_pull_simple_feedback.ty",analysis_fn=contrib.jaanalysis.push_pull_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/PP5/",times=[5005,10005],snapshot=False,dirname_prefix='

a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"


