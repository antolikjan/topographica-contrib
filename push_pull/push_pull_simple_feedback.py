"""
The complex cell LISSOM model.

Jan Antolik and James A. Bednar
Development of Maps of Simple and Complex Cells in the Primary Visual Cortex
Frontiers in Computation Neuroscience 2011; 5: 17. 
"""

import numpy
from math import pi, sqrt
import param
from topo.pattern import Selector, Null
import topo.pattern
import topo.pattern.random
import topo.pattern.image
from topo.sheet.lissom import LISSOM
from topo.sheet import JointNormalizingCFSheet_Continuous
from topo.sheet import GeneratorSheet
from topo.projection import CFProjection, SharedWeightCFProjection,OneToOneProjection
from topo.responsefn.optimized import CFPRF_DotProduct_opt
from topo.base.cf import CFSheet
from topo.base.arrayutil import clip_lower
from topo.base.boundingregion import BoundingBox
from topo.learningfn.optimized import CFPLF_Hebbian_opt
from topo.transferfn.optimized import CFPOF_DivisiveNormalizeL1_opt
from topo.transferfn.misc import PatternCombine, HalfRectify, HomeostaticResponse
from topo.transferfn import DivisiveNormalizeL1, Hysteresis, TransferFnWithState
from topo import numbergen
from topo.pattern import Gaussian
from topo.base.functionfamily import CoordinateMapperFn
from topo.base.patterngenerator import PatternGenerator, Constant 
from topo.numbergen import UniformRandom, BoundedNumber, ExponentialDecay
from contrib.jacommands import SimpleHomeoLinear, Jitterer, Expander, randomize_V1Simple_relative_LGN_strength, Jitter
from contrib.push_pull.CCLISSOM_push_pull_extra import CFPLF_KeyserRule
topo.sim.name = "complex_cell_lissom"


image_filenames=["/exports/work/inf_ndtc/s0570140/NEW_ENVIRONMENT/topographica/images/konig/seq1/seq1-%05d.tif"%(i*10+1) for i in xrange(100)]
#### Set up retinal inputs
inputs=[topo.pattern.image.FileImage(filename=f,
	            size=10.0,  #size_normalization='original',(size=10.0)
	            x=0,y=0,scale=0.55,orientation=0)
        for f in image_filenames]

input = Jitterer(generator=topo.pattern.Selector(generators=inputs),orientation=numbergen.UniformRandom(lbound=-pi,ubound=pi,seed=56),reset_period=15,jitter_magnitude=0.4)
ring = topo.pattern.Composite(operator=numpy.add,x=numbergen.UniformRandom(lbound=-1.0,ubound=1.0,seed=12),
                                    y=numbergen.UniformRandom(lbound=-1.0,ubound=1.0,seed=36),
		                    generators=[topo.pattern.Ring(size=0.5, aspect_ratio=1.0, scale=0.064,thickness=0.02,
                                                offset=0.0,
                                                bounds=BoundingBox(radius=2.125), smoothing=0.02),
                                		topo.pattern.random.UniformRandom(offset=0, scale=0.01)]
                                   )

retinal_waves=Expander(generator=ring,orientation=numbergen.UniformRandom(lbound=-pi,ubound=pi,seed=56),reset_period=15,speed=0.3)
zeroInput = topo.pattern.Null();

jitterOn = Jitter(rand =numbergen.UniformRandom(seed=1023))
jitterOff = Jitter(rand =numbergen.UniformRandom(seed=1023))

# Specify weight initialization, response function, and learning function
CFProjection.weights_generator=topo.pattern.random.UniformRandom()
CFProjection.cf_shape=topo.pattern.Disk(smoothing=0.0)
CFProjection.response_fn=CFPRF_DotProduct_opt()
CFProjection.learning_fn=CFPLF_Hebbian_opt()
CFProjection.weights_output_fns=[CFPOF_DivisiveNormalizeL1_opt()]

# Set up transfer function and homeostatic mechanisms
V1Simple_OF = SimpleHomeoLinear(t_init=0.35,alpha=3,mu=0.003,eta=0.002)
V1Simple_OFInh = SimpleHomeoLinear(t_init=0.35,alpha=3,mu=0.003,eta=0.002)
#V1Simple_OF = HomeostaticResponse(t_init=0.35,linear_slope=3,target_activity=0.003,learning_rate=0.002*18,seed=123,smoothing=0.9946,period=1.0)
V1Complex_OF=HalfRectify()
NN = PatternCombine(generator=topo.pattern.random.GaussianRandom(scale=0.02,offset=0.0),operator=numpy.add)



# Build simulation
topo.sim['Retina']=GeneratorSheet(nominal_density=48.0,
                                input_generator=input,  
                                period=1.0, phase=0.05,
                                nominal_bounds=BoundingBox(radius=0.5+0.25+0.375+0.25))

topo.sim['FakeRetina']=GeneratorSheet(nominal_density=48.0,
                                  input_generator=retinal_waves,  
                                  period=1.0, phase=0.05,
                                  nominal_bounds=BoundingBox(radius=0.5+0.25+0.25))


topo.sim['LGNOn']=LISSOM(nominal_density=48,
                          nominal_bounds=BoundingBox(radius=0.5+0.25+0.25),
                          output_fns=[HalfRectify(t_init=0.0)],tsettle=0,
                          measure_maps=False)

topo.sim['LGNOff']=LISSOM(nominal_density=48,
                           nominal_bounds=BoundingBox(radius=0.5+0.25+0.25),
                           output_fns=[HalfRectify(t_init=0.0)],tsettle=0,
                           measure_maps=False)

topo.sim['V1Simple'] = JointNormalizingCFSheet_Continuous(nominal_density=96,
                        nominal_bounds=BoundingBox(radius=0.5),
                        output_fns=[Hysteresis(time_constant=0.3),NN,V1Simple_OF])

                        
topo.sim['V1Complex'] = JointNormalizingCFSheet_Continuous(nominal_density=96,
                        nominal_bounds=BoundingBox(radius=0.5),
                        output_fns=[Hysteresis(time_constant=0.3),V1Complex_OF])
                        
topo.sim['V1SimpleInh'] = JointNormalizingCFSheet_Continuous(nominal_density=96,
                        nominal_bounds=BoundingBox(radius=0.5),
                        output_fns=[Hysteresis(time_constant=0.3),NN,V1Simple_OFInh])
                        

# DoG weights for the LGN
#centerg   = Gaussian(size=0.07385,aspect_ratio=1.0,output_fns=[DivisiveNormalizeL1()])
centerg   = Gaussian(size=0.07,aspect_ratio=1.0,output_fns=[DivisiveNormalizeL1()])
surroundg = Gaussian(size=0.2,aspect_ratio=1.0,output_fns=[DivisiveNormalizeL1()])

on_weights = topo.pattern.Composite(
    generators=[centerg,surroundg],operator=numpy.subtract)

off_weights = topo.pattern.Composite(
    generators=[surroundg,centerg],operator=numpy.subtract)

topo.sim.connect('FakeRetina','LGNOn',delay=0.05,
                 connection_type=OneToOneProjection,strength=7.0,name='Afferent')
    
topo.sim.connect('FakeRetina','LGNOff',delay = 0.05,
                 connection_type=OneToOneProjection,strength=7.0,name='Afferent')


g1 = Gaussian(aspect_ratio=1.0,scale=1.0,size=numbergen.UniformRandom(lbound=0.8,ubound=0.8,seed=56))
g1._Dynamic_time_fn = None
g2 = Gaussian(aspect_ratio=1.0,scale=1.0,size=numbergen.UniformRandom(lbound=0.8,ubound=0.8,seed=56))
g2._Dynamic_time_fn = None

LGNStr = 4
inbalance = 0.1
LGNOnStr = LGNStr+LGNStr*inbalance
LGNOffStr = LGNStr-LGNStr*inbalance

#Layer 4C
topo.sim.connect('LGNOn','V1Simple',delay=0.025,dest_port=('Activity','JointNormalize', 'Afferent'),
                 connection_type=CFProjection,strength=LGNOnStr,name='LGNOnAfferent',
                 weights_generator=topo.pattern.Composite(operator=numpy.multiply, 
                     generators=[g1
                 ,topo.pattern.random.UniformRandom()]),
                 nominal_bounds_template=BoundingBox(radius=0.2),
                 coord_mapper=jitterOn,apply_output_fns_init=False,
                 learning_rate=(BoundedNumber(bounds=(0.0,None),generator=
                               ExponentialDecay(starting_value = 0.5,
                                                time_constant=16000))))


topo.sim.connect('LGNOff','V1Simple',delay=0.025,dest_port=('Activity','JointNormalize', 'Afferent'),
                 connection_type=CFProjection,strength=LGNOffStr,name='LGNOffAfferent',
                 weights_generator=topo.pattern.Composite(operator=numpy.multiply, 
                     generators=[g2
                 ,topo.pattern.random.UniformRandom()]),
                 nominal_bounds_template=BoundingBox(radius=0.2),
                 coord_mapper=jitterOff,apply_output_fns_init=False,
                 learning_rate=(BoundedNumber(bounds=(0.0,None),generator=
                               ExponentialDecay(starting_value = 0.5,
                                                time_constant=16000))))


# we use the g1 and g2 generators again because the Jitter between excitatory and inhibitory sheet is independent
topo.sim.connect('LGNOn','V1SimpleInh',delay=0.025,dest_port=('Activity','JointNormalize', 'Afferent'),
                 connection_type=CFProjection,strength=LGNOnStr,name='LGNOnAfferentInh',
                 weights_generator=topo.pattern.Composite(operator=numpy.multiply, 
                     generators=[g1
                 ,topo.pattern.random.UniformRandom()]),
                 nominal_bounds_template=BoundingBox(radius=0.2),
                 coord_mapper=jitterOn,apply_output_fns_init=False,
                 learning_rate=(BoundedNumber(bounds=(0.0,None),generator=
                               ExponentialDecay(starting_value = 0.5,
                                                time_constant=16000))))


topo.sim.connect('LGNOff','V1SimpleInh',delay=0.025,dest_port=('Activity','JointNormalize', 'Afferent'),
                 connection_type=CFProjection,strength=LGNOffStr,name='LGNOffAfferentInh',
                 weights_generator=topo.pattern.Composite(operator=numpy.multiply, 
                     generators=[g2
                 ,topo.pattern.random.UniformRandom()]),
                 nominal_bounds_template=BoundingBox(radius=0.2),
                 coord_mapper=jitterOff,apply_output_fns_init=False,
                 learning_rate=(BoundedNumber(bounds=(0.0,None),generator=
                               ExponentialDecay(starting_value = 0.5,
                                                time_constant=16000))))

#Layer 4C -> 4C
topo.sim.connect('V1Simple','V1Simple',delay=0.025,name='L4EtoE',
                 connection_type=CFProjection,strength=0.1,
                 weights_generator=topo.pattern.Gaussian(aspect_ratio=1.0, size=0.4),
                 nominal_bounds_template=BoundingBox(radius=0.12),
                 learning_rate=0.2)


topo.sim.connect('V1Simple','V1SimpleInh',delay=0.025,name='L4EtoI',
                 connection_type=CFProjection,strength=0.1,
                 weights_generator=topo.pattern.Gaussian(aspect_ratio=1.0, size=0.4),
                 nominal_bounds_template=BoundingBox(radius=0.12),
                 learning_rate=0.2)

topo.sim.connect('V1SimpleInh','V1Simple',delay=0.025,name='L4ItoE',
                 connection_type=CFProjection,strength=0.3,
                 weights_generator=topo.pattern.Gaussian(aspect_ratio=1.0, size=0.4),
                 nominal_bounds_template=BoundingBox(radius=0.12),learning_fn = CFPLF_KeyserRule("V1Simple",['L4ItoE']),
                 learning_rate=0.5)

topo.sim.connect('V1SimpleInh','V1SimpleInh',delay=0.025,name='L4ItoI',
                 connection_type=CFProjection,strength=0.3,
                 weights_generator=topo.pattern.Gaussian(aspect_ratio=1.0, size=0.4),
                 nominal_bounds_template=BoundingBox(radius=0.12),learning_fn = CFPLF_KeyserRule("V1SimpleInh",['L4ItoI']),
                 learning_rate=0.5)


#Layer 2/3
topo.sim.connect('V1Simple','V1Complex',delay=0.025,
<<<<<<< HEAD:CCLISSOM_push_pull.ty
                 connection_type=CFProjection,strength=__main__.__dict__.get('StoCStr',2.5),name='V1SimpleAfferent',
=======
                 connection_type=CFProjection,strength=2.5,name='V1SimpleAfferent',
>>>>>>> 8023d6ecaf08b4fb5ec43ddcaab000ebad7d927c:push_pull/push_pull_simple_feedback.py
                 weights_generator=Gaussian(aspect_ratio=1.0, size=0.05),
                 nominal_bounds_template=BoundingBox(radius=0.075),learning_rate=0.0)
                
topo.sim.connect('V1Complex','V1Simple',delay=0.025,
                 connection_type=CFProjection,strength=0.14,name='V1SimpleFeedbackExc2Exc',
                 weights_generator=Gaussian(aspect_ratio=1.0, size=18),
                 nominal_bounds_template=BoundingBox(radius=0.0025),
                 learning_rate=0)

topo.sim.connect('V1Complex','V1Simple',delay=0.025,
                 connection_type=CFProjection,strength=-4.6,name='V1SimpleFeedbackInh2Exc',
                 weights_generator=Gaussian(aspect_ratio=1.0, size=2.5),
                 nominal_bounds_template=BoundingBox(radius=0.2),learning_rate=0)


topo.sim.connect('V1Complex','V1SimpleInh',delay=0.025,
                 connection_type=CFProjection,strength=0.14,name='V1SimpleFeedbackExc2Inh',
                 weights_generator=Gaussian(aspect_ratio=1.0, size=18),
                 nominal_bounds_template=BoundingBox(radius=0.0025),
                 learning_rate=0)

topo.sim.connect('V1Complex','V1SimpleInh',delay=0.025,
                 connection_type=CFProjection,strength=-4.6,name='V1SimpleFeedbackInh2Inh',
                 weights_generator=Gaussian(aspect_ratio=1.0, size=2.5),
                 nominal_bounds_template=BoundingBox(radius=0.2),learning_rate=0)


topo.sim.connect('V1Complex','V1Complex',delay=0.025,name='LateralExcitatory',
                 connection_type=CFProjection,strength=1.5,
                 weights_generator=topo.pattern.Gaussian(aspect_ratio=1.0, size=0.4),
                 nominal_bounds_template=BoundingBox(radius=0.12),
                 learning_rate=0.0)

topo.sim.connect('V1Complex','V1Complex',delay=0.025,name='LateralInhibitory',
                 connection_type=CFProjection,strength=-1.5,
                 weights_generator=topo.pattern.Composite(operator=numpy.multiply, 
                 generators=[Gaussian(aspect_ratio=1.0, size=2*0.22917),
                 topo.pattern.random.UniformRandom()]),
                 nominal_bounds_template=BoundingBox(radius=0.4),
                 learning_rate=(BoundedNumber(bounds=(0.0,None),generator=
                               ExponentialDecay(starting_value=0.2,time_constant=8000))))

topo.sim.schedule_command(5000,"secondStage()")

def secondStage():
    topo.sim.connect('Retina','LGNOn',delay=0.05,
                    connection_type=SharedWeightCFProjection,strength=7.0,
                    nominal_bounds_template=BoundingBox(radius=0.375),name='LGNOnAfferent3',
                    weights_generator=on_weights)
    
    topo.sim.connect('Retina','LGNOff',delay = 0.05,
                    connection_type=SharedWeightCFProjection,strength=7.0,
                    nominal_bounds_template=BoundingBox(radius=0.375),name='LGNOffAfferent4',
                    weights_generator=off_weights)
    
    topo.sim['FakeRetina'].set_input_generator(zeroInput)
    topo.sim['LGNOn'].in_connections[0].strength=0
    topo.sim['LGNOff'].in_connections[0].strength=0
    randomize_V1Simple_relative_LGN_strength(prob=0.5)
    randomize_V1Simple_relative_LGN_strength(sheet_name="V1SimpleInh",prob=0.5)
