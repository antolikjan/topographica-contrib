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

# Testing against the best LESI results, it should be this 
"A=0,RetinaStrFS=1.5,RetinaStrSS=6.99,FREQ=2.4,analysis_scale=1.0,LC=20,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.1,Thickness=0.01,ImageScale=0.23,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.0166666,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='LC',c_default_density=72"

# Trying to take contrast 100 to 15
"A=1,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.3,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.111,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=2,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=4.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=48,max_curves=27"
"A=3,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=4,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=1.6,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=160,c_default_density=72,max_curves=27,"
"A=5,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=300,c_default_density=72,max_curves=27,"
"A=6,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=4.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=400,c_default_density=72,max_curves=27,"
"A=7,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,SPACE=0.05,max_curves=27"
"A=8,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,SPACE=0.1,max_curves=27"
"A=9,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=48,max_curves=27"
"A=10,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=48,max_curves=35"
"A=11,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=72,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=48,max_curves=27"
"A=12,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=96,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=48,max_curves=27"
"A=13,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=6.5,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=14,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=6.7,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=15,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=6.9,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=16,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=17,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.5,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=18,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=2.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.8,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=19,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=20,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=220,c_default_density=72,max_curves=27,"
"A=21,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=240,c_default_density=72,max_curves=27,"
"A=22,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=260,c_default_density=72,max_curves=27,"
"A=23,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=280,c_default_density=72,max_curves=27,"
"A=24,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,duration=1.0,"
"A=25,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,duration=2.0,"
"A=26,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.3,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,duration=3.0,"
"A=27,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.25,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=28,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.2,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=29,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.1,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,"
"A=30,RetinaStrFS=0.225,RetinaStrSS=1.05,FREQ=2.4,analysis_scale=3.0,LC=150,SL=False,CRS=0.5,StoCStr=3.4,SETA=0.002,SOF='SimpleHomeo',S_lr=0.9,JM=0.4,SAlpha=3,FStrExc=0.14,FStrInh=-2.4,S_tc=16000,COF='SimpleHomeoInh',STresh=0.35,Jitter=0.2,intrinsic_noise=0.025,Speed=0.2,Period=20,CxLatExcSize=0.4,LGNCenterSize=0.05,LGNSurrSize=0.15,FInhSize=0.35,V1Aff_size=0.2,Smoothing=0.02,LGNStr=7.2,imageset='Konig',lgn_tresh=0.0,lgn_density=48,GC=True,RingScale=0.666,Thickness=0.01,ImageScale=1.533,SMU=0.002,Inbalance=0.3,SST=5000,CxLatInhBB=0.4,default_density=72,LongEIBB=10.0,LongEEBB=10.0,CS=0.8,LocalEIStr=1.7,LongEIStr=7.0,V1CInhTresh=0.2,CTresh=0.13,LongEESize=10.0,LongEISize=10.0,LocalIEStr=0.34,LocalIIStr=1.2,V1CInhGain=1.0,LatLGNStr=0.5,SurrSize=0.1,LGNGain=0.18,FInhBB=0.6,FExcBB=0.1,rand_scale=0.055,Region=50,lat_lr=0.05,lat_tc=16000,CIAlpha=1.1,CIMU=0.03,CIETA=0.0002,save=False,MAX_SIZE=1.2,ContrastCenter='HC',HC=200,c_default_density=72,max_curves=27,")


args='import matplotlib; matplotlib.use("Agg"); from topo.command import run_batch ; import contrib.jaanalysis; run_batch("/exports/home/v1jantol/go_new/topographica/contrib/cc_lesi_final.ty",analysis_fn=contrib.jaanalysis.complex_surround_analysis_function,output_directory="/exports/home/v1jantol/go_new/RESULTS/CCLESI11/",times=[10000],snapshot=False,dirname_prefix='
a="$args 'A$1', $argsprefix ${arguments[$1]}  )"
echo "${a}"
/exports/home/v1jantol/go_new/topographica/topographica -c openmp=True  -c openmp_threads=6 -c "${a}"




















