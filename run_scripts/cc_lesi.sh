#!/bin/bash
#$ -cwd -V
#$ -l h_rt=47:59:00
#$ -q ecdf
#$ -R y
#$ -pe OpenMP 6
#$ -N cc_lesi
export OMP_NUM_THREADS=$NSLOTS
source /exports/home/v1jantol/go_new/virt_envs/topo/bin/activate
echo 'starting'
argsprefix=""


arguments=(
"A=0,RetinaStrFS=1.5,RetinaStrSS=6.99,FREQ=2.4,analysis_scale=1.0,LC=20,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.1,Thickness=0.01,ImageScale=0.23,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.0166666,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='LC',c_default_density=72,"
"A=1,RetinaStrFS=1.5,RetinaStrSS=6.99,FREQ=2.4,analysis_scale=1.0,LC=30,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.1,Thickness=0.01,ImageScale=0.23,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.0166666,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='LC',c_default_density=72,"
"A=2,RetinaStrFS=1.5,RetinaStrSS=6.99,FREQ=2.4,analysis_scale=1.0,LC=40,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.1,Thickness=0.01,ImageScale=0.23,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.0166666,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='LC',c_default_density=72,"
"A=3,RetinaStrFS=1.5,RetinaStrSS=6.99,FREQ=2.4,analysis_scale=1.0,LC=70,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.1,Thickness=0.01,ImageScale=0.23,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.0166666,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='LC',c_default_density=72,"


"A=4,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,SPACE=0.05"
"A=5,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,SPACE=0.0"
"A=6,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.3,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=230,c_default_density=72,max_curves=27,SPACE=0.0"
"A=7,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.6,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=260,c_default_density=72,max_curves=27,SPACE=0.0"
"A=8,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.9,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=290,c_default_density=72,max_curves=27,SPACE=0.0"
"A=9,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=6.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,SPACE=0.0"
"A=10,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=5.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,SPACE=0.0"
"A=11,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=2.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,SPACE=0.0"
)

args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("/exports/home/v1jantol/go_new/topographica/contrib/cc_lesi_final.ty",analysis_fn=contrib.jaanalysis.complex_surround_analysis_function,output_directory="/exports/home/v1jantol/go_new/RESULTS/CCLESI15/",times=[10000],snapshot=False,dirname_prefix='
a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/v1jantol/go_new/topographica/topographica -c openmp=True  -c openmp_threads=6 -c "${a}"




















