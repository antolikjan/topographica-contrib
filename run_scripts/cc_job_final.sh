#!/bin/bash -i
#$ -S /bin/bash
#$ -cwd 


argsprefix=""

echo $argsprefix
let "a=RANDOM/160"
sleep $a
source ./virt_envs/topo/bin/activate

arguments=(
"CS=0.5,default_density=96,CxLatInhBB=0.4,SST=5000,SETA=0.002,SOF='SimpleHomeo',SAlpha=3,COF='HR',STresh=0.35,LatInh_tc=8000,CxLatExcSize=0.4,LGNCenterSize=0.07,LGNSurrSize=0.2,FInhSize=0.4,V1Aff_size=0.2,LatInh_lr=0.2,Smoothing=0.02,imageset='Konig',lgn_tresh=0.0, Thickness=0.02,FInhBB=0.2,FExcBB=0.0025, LGNAff2=7.0,LGNAff=7.0,RingScale=0.064,rand_scale=0.01,CRS=0.5,lgn_density=48,LGNStr=4,GC=False,analysis_scale=1.0,Jitter=0.5,Speed=0.3,Period=15,CxLatExcStr=1.5,CxLatInhStr=1.5,intrinsic_noise=0.02,FStrExc=0.14,FStrInh=-4.6,Inbalance=0.1,basic=True,StoCStr=2.5,SL=False,S_lr=0.5,S_tc=16000,SMU=0.003,ImageScale=0.55,JM=0.4"
"CS=0.5,default_density=96,CxLatInhBB=0.4,SST=5000,SETA=0.002,SOF='SimpleHomeo',SAlpha=3,COF='HR',STresh=0.35,LatInh_tc=8000,CxLatExcSize=0.4,LGNCenterSize=0.07,LGNSurrSize=0.2,FInhSize=0.4,V1Aff_size=0.2,LatInh_lr=0.2,Smoothing=0.02,imageset='Konig',lgn_tresh=0.0, Thickness=0.02,FInhBB=0.2,FExcBB=0.0025, LGNAff2=7.0,LGNAff=7.0,RingScale=0.064,rand_scale=0.01,CRS=0.5,lgn_density=48,LGNStr=4,GC=False,analysis_scale=1.0,Jitter=0.5,Speed=0.3,Period=15,CxLatExcStr=1.5,CxLatInhStr=1.5,intrinsic_noise=0.02,FStrExc=0.14,FStrInh=-4.6,Inbalance=0.1,basic=True,StoCStr=2.5,SL=True,S_lr=0.5,S_tc=16000,SMU=0.003,ImageScale=0.55,JM=0.4,SxLatExcStr=0.375,SxLatInhStr=0.375"
"CS=0.5,default_density=96,CxLatInhBB=0.4,SST=5000,SETA=0.002,SOF='SimpleHomeo',SAlpha=3,COF='HR',STresh=0.35,LatInh_tc=8000,CxLatExcSize=0.4,LGNCenterSize=0.07,LGNSurrSize=0.2,FInhSize=0.4,V1Aff_size=0.2,LatInh_lr=0.2,Smoothing=0.02,imageset='Konig',lgn_tresh=0.0, Thickness=0.02,FInhBB=0.2,FExcBB=0.0025, LGNAff2=7.0,LGNAff=7.0,RingScale=0.064,rand_scale=0.01,CRS=0.5,lgn_density=48,LGNStr=4,GC=False,analysis_scale=1.0,Jitter=0.5,Speed=0.3,Period=15,CxLatExcStr=1.5,CxLatInhStr=1.5,intrinsic_noise=0.02,FStrExc=0.14,FStrInh=-4.6,Inbalance=0.1,basic=True,StoCStr=2.5,SL=True,S_lr=0.5,S_tc=16000,SMU=0.003,ImageScale=0.55,JM=0.4,SxLatExcStr=0.75,SxLatInhStr=0.75"
"CS=0.5,default_density=96,CxLatInhBB=0.4,SST=5000,SETA=0.002,SOF='SimpleHomeo',SAlpha=3,COF='HR',STresh=0.35,LatInh_tc=8000,CxLatExcSize=0.4,LGNCenterSize=0.07,LGNSurrSize=0.2,FInhSize=0.4,V1Aff_size=0.2,LatInh_lr=0.2,Smoothing=0.02,imageset='Konig',lgn_tresh=0.0, Thickness=0.02,FInhBB=0.2,FExcBB=0.0025, LGNAff2=7.0,LGNAff=7.0,RingScale=0.064,rand_scale=0.01,CRS=0.5,lgn_density=48,LGNStr=4,GC=False,analysis_scale=1.0,Jitter=0.5,Speed=0.3,Period=15,CxLatExcStr=1.5,CxLatInhStr=1.5,intrinsic_noise=0.02,FStrExc=0.14,FStrInh=-4.6,Inbalance=0.1,basic=True,StoCStr=2.5,SL=True,S_lr=0.5,S_tc=16000,SMU=0.003,ImageScale=0.55,JM=0.4,SxLatExcStr=1.5,SxLatInhStr=1.5")

       
args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("./topographica/contrib/cc_lissom_oo_or_simple_rv.ty",analysis_fn=contrib.jaanalysis.complex_analysis_function,output_directory="/exports/home/s0570140/go_new/RESULTS/CCLISSOM1/",times=[5002,5003,5004,5005,5006,5007,10001,10002,10003,10004,10005],snapshot=False,dirname_prefix='
a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/s0570140/go_new/topographica/topographica -c openmp=True  -c openmp_threads=4 -c "${a}"

