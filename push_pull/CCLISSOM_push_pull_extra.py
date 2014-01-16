import __main__
import numpy
import param 
import copy
import topo

from topo.base.patterngenerator import PatternGenerator, Constant 
from topo import numbergen
from topo.transferfn import TransferFnWithState 
from topo.pattern import Selector, Null
from topo.base.cf import CFPLearningFn,CFPLF_Plugin
from topo.base.arrayutil import clip_lower
from param import normalize_path

class CFPLF_KeyserRule(CFPLearningFn):
    """
    CF-aware Anti-Hebbian like learning rule rule.

    Based on: 
    
    Andrew S. Kayser and Kenneth D. Miller,
    Opponent Inhibition: A Developmental Model of Layer 4 of the Neocortical Circuit    
    Neuron, Vol. 33, 131-142, January 3, 2002
    
    JAHACK:
    This is going to work correctly only if all inhibitory projections are subtractive,
    but technically all already defined learning rules have that problem!!!
    """
    
    def __init__(self,sheet,inhibitory_projection_list):
        self.sheet = sheet
        self.inhibitory_projection_list = inhibitory_projection_list
    
    def __call__(self, iterator, input_activity, output_activity, learning_rate, **params):
        
        single_connection_learning_rate = self.constant_sum_connection_rate(iterator.proj_n_units,learning_rate)
        if single_connection_learning_rate==0:
            return
	

        #calculate overall incomming inhibition
        inhibition = 0
        for s in self.inhibitory_projection_list:
            p = topo.sim[self.sheet].projections()[s]
            inhibition += abs(p.activity)

        for cf,i in iterator():
            # Anti-hebbian part
            if output_activity.flat[i] != 0:
                cf.weights -= single_connection_learning_rate * output_activity.flat[i] * cf.get_input_matrix(input_activity)
            
            # inhibition part
            if inhibition.flat[i] != 0:
                cf.weights += single_connection_learning_rate * inhibition.flat[i] * cf.get_input_matrix(input_activity)
            
            # make sure weights outside of mask are not changed
            cf.weights *= numpy.multiply((cf.weights>0),cf.mask)
        

def circular_dist(a,b,period):
    """
    The distance between a and b (scalars) in the periodic. 
    a,b have to be in (0,period)
    """
    return  numpy.minimum(abs(a-b), period - abs(a-b))

def rad_to_complex(vector):
    """
    Converts a vector/matrix of angles (0,2*pi) to vector/matrix of complex numbers (that will lie on the unit circle)
    """
    return numpy.cos(vector)+1j*numpy.sin(vector)
    

def angle_to_pi(array):
    """
    returns angles of complex numbers in array but in (0,2*pi) interval unlike numpy.angle the returns it in (-pi,pi)
    """
    return (numpy.angle(array)+ 4*numpy.pi) % (numpy.pi*2)
    

def circ_mean(matrix, weights=None, axis=None, low=0, high=numpy.pi*2,
              normalize=False):
    """
    Circular mean of matrix. Weighted if weights are not none.

    matrix     - matrix of data. Mean will be computed along axis axis.
    weights    - if not none, matrix of the same size as matrix
    low, high  - the min and max values that will be mapped onto the periodic
                 interval of (0, 2pi)
    axis       - axis along which to compute the circular mean. default = 0 (columns)
    normalize  - if True weights will be normalized along axis. If any weights
                 that are to be jointly normalized are all zero they will be
                 kept zero!

    return (angle, length) - where angle is the circular mean, and len is the
                           length of the resulting mean vector
    """

    # check whether matrix and weights are ndarrays
    if weights != None:
       assert matrix.shape == weights.shape 
    
    if axis == None:
        axis == 0

    # convert the periodic matrix to corresponding complex numbers
    m = rad_to_complex((matrix - low)/(high - low) * numpy.pi*2)

    # normalize weights
    if normalize:
        row_sums = numpy.sum(numpy.abs(weights), axis=axis)
        row_sums[numpy.where(row_sums == 0)] = 1.0
        if axis == 1:
            weights = weights / row_sums[:, numpy.newaxis]
        else:
            weights = numpy.transpose(weights) / row_sums[:, numpy.newaxis]
            weights = weights.T
            
    if weights == None:
        m = numpy.mean(m, axis=axis)
    else:
        z = numpy.multiply(m,weights)
        m = numpy.mean(z, axis=axis)

    return ((angle_to_pi(m) / (numpy.pi*2))*(high-low) + low, abs(m))

def analyse_push_pull_connectivity():
    _analyse_push_pull_connectivity('V1Simple','V1SimpleExcToExc')
    _analyse_push_pull_connectivity('V1SimpleInh','V1SimpleExcToInh')
    _analyse_push_pull_connectivity('V1Simple','V1SimpleInhToExc')
    _analyse_push_pull_connectivity('V1SimpleInh','V1SimpleInhToInh')
    #_analyse_push_pull_connectivity('V1Complex','LateralExcitatory')

def _analyse_push_pull_connectivity1(sheet_name,proj_name):
    """
    It assumes orientation preference was already measured.
    """
    projection = topo.sim[sheet_name].projections()[proj_name]
    or_pref = topo.sim[projection.src.name].sheet_views['OrientationPreference'].view()[0]*numpy.pi
    phase_pref = topo.sim[projection.src.name].sheet_views['PhasePreference'].view()[0]*numpy.pi*2
    or_pref_target = topo.sim[projection.dest.name].sheet_views['OrientationPreference'].view()[0]*numpy.pi
    phase_pref_target = topo.sim[projection.dest.name].sheet_views['PhasePreference'].view()[0]*2*numpy.pi
    
    app  = []
    app_or = []
    av1 = []
    av2 = []
    for (i,cf) in enumerate(projection.cfs.flatten()):
        this_or = or_pref.flatten()[i]
        this_phase = phase_pref.flatten()[i]
        ors = cf.input_sheet_slice.submatrix(or_pref).flatten()
        phases = cf.input_sheet_slice.submatrix(phase_pref).flatten()
        weights = numpy.multiply(cf.weights,cf.mask)
        
        #Let's compute the mean orientation preference of connecting neurons
        z = circ_mean(numpy.array([ors]),weights=numpy.array([weights.flatten()]),axis=1,low=0.0,high=numpy.pi,normalize=False)
        app_or.append(z[0])
        
        #First lets compute the average phase of neurons which are within 30 degrees of the given neuron
        within_30_degrees = numpy.nonzero((circular_dist(ors,this_or,numpy.pi) < (numpy.pi/6.0))*1.0)[0]
        #if len(within_30_degrees) != 0:
        z = circ_mean(numpy.array([phases]),weights=numpy.array([weights.flatten()]),axis=1,low=0.0,high=numpy.pi*2,normalize=False)
        app.append(z[0])
        
        #else:
        #    app.append(0.0)
            
        #Now lets compare the average connection strength to neurons oriented within 30 degrees and having the same phase (within 60 degrees), with the average connections strength to neurons more than 30 degrees off in orientation
        outside_30_degrees = numpy.nonzero(circular_dist(ors,this_or,numpy.pi) > numpy.pi/6.0)[0]
        within_30_degrees_and_same_phase = numpy.nonzero(numpy.multiply(circular_dist(ors,this_or,numpy.pi) < numpy.pi/6.0,circular_dist(phases,this_phase,2*numpy.pi) < numpy.pi/3.0))[0]
        
        if len(outside_30_degrees) != 0:
            av1.append(numpy.mean(weights.flatten()[outside_30_degrees])/max(len(outside_30_degrees),1.0))
        else:
            av1.append(0.0)
        if len(within_30_degrees_and_same_phase) != 0:
            av2.append(numpy.mean(weights.flatten()[within_30_degrees_and_same_phase])/max(len(within_30_degrees_and_same_phase),1.0))
        else:
            av2.append(0.0)
        
        

    import pylab
    pylab.figure()
    pylab.subplot(3,1,1)
    pylab.plot(numpy.array(app_or),or_pref_target.flatten(),'ro')
    pylab.title(proj_name)
    pylab.subplot(3,1,2)
    pylab.plot(numpy.array(app),phase_pref_target.flatten(),'ro')
    pylab.subplot(3,1,3)
    pylab.bar(numpy.arange(2), (numpy.mean(av1),numpy.mean(av2)),   0.35, color='b')
    pylab.savefig(normalize_path('PPconnectivity: ' + proj_name + str(topo.sim.time()) + '.png'));

def _analyse_push_pull_connectivity(sheet_name,proj_name):
    or_bins = numpy.linspace(0,numpy.pi,31)
    phase_bins = numpy.linspace(0,numpy.pi*2,31)
    
    projection = topo.sim[sheet_name].projections()[proj_name]
    or_pref = topo.sim[projection.src.name].sheet_views['OrientationPreference'].view()[0]*numpy.pi
    phase_pref = topo.sim[projection.src.name].sheet_views['PhasePreference'].view()[0]*numpy.pi*2
    or_pref_target = topo.sim[projection.dest.name].sheet_views['OrientationPreference'].view()[0]*numpy.pi
    phase_pref_target = topo.sim[projection.dest.name].sheet_views['PhasePreference'].view()[0]*2*numpy.pi
    
    phase_connection_strength = numpy.zeros((30,1))
    orientation_connection_strength = numpy.zeros((30,1))
    
    for (i,cf) in enumerate(projection.cfs.flatten()):
        this_or = or_pref_target.flatten()[i]
        this_phase = phase_pref_target.flatten()[i]
        ors = cf.input_sheet_slice.submatrix(or_pref).flatten()
        phases = cf.input_sheet_slice.submatrix(phase_pref).flatten()
        weights = numpy.multiply(cf.weights,cf.mask).flatten()
        
        for j,k in enumerate(numpy.digitize(circular_dist(ors,this_or,numpy.pi),or_bins)):
            orientation_connection_strength[k-1] += weights[j]
        for j,k in enumerate(numpy.digitize(circular_dist(phases,this_phase,2*numpy.pi),phase_bins)):
            phase_connection_strength[k-1] += weights[j]
        
    import pylab
    pylab.figure()
    pylab.subplot(2,1,1)
    pylab.hold('on')
    pylab.plot(numpy.linspace(0,numpy.pi,30,endpoint=False)+numpy.pi/60,orientation_connection_strength,'k',linewidth=2.0)
    pylab.plot(numpy.linspace(0,numpy.pi,30,endpoint=False)+numpy.pi/60,orientation_connection_strength,'ko')
    pylab.title(proj_name,fontsize=20)
    pylab.autoscale(tight=True)
    pylab.subplot(2,1,2)
    pylab.hold('on')
    pylab.plot(numpy.linspace(0,numpy.pi*2,30,endpoint=False)+2*numpy.pi/60,phase_connection_strength,'k',linewidth=2.0)
    pylab.plot(numpy.linspace(0,numpy.pi*2,30,endpoint=False)+2*numpy.pi/60,phase_connection_strength,'ko')
    pylab.autoscale(tight=True)
    
    from param import normalize_path
    pylab.savefig(normalize_path('PPconnectivity: ' + proj_name + str(topo.sim.time()) + '.png'));
    
        
        

import matplotlib.gridspec as gridspec
import pylab

def plot_domains_stability(gs,mr):
      gs = gridspec.GridSpecFromSubplotSpec(2, len(mr.records.keys()), subplot_spec=gs)  
      for i,s in enumerate(mr.records.keys()):
          ax = pylab.subplot(gs[0,i])
          ax.imshow(mr.records[s]['activity'][20],cmap='gray') 
          ax = pylab.subplot(gs[1,i])
          ax.imshow(sum(mr.records[s]['activity']),cmap='gray') 

      #gs = gridspec.GridSpecFromSubplotSpec(3,11, subplot_spec=gs)  
      #for i in xrange(0,10):
           #ax = pylab.subplot(gs[0,i])
           #ax.imshow(mr.records["V1Complex"]['activity'][i],cmap='gray') 
           #ax = pylab.subplot(gs[1,i])
           #ax.imshow(mr.records["V1Simple"]['activity'][i],cmap='gray') 
           #ax = pylab.subplot(gs[2,i])
           #ax.imshow(mr.records["FakeRetina"]['activity'][i],cmap='gray') 
           
           ##ax = pylab.subplot(gs[1,i])
           ##ax.imshow(mr.records["FakeRetina"]['activity'][i],cmap='gray') 

      #ax = pylab.subplot(gs[0,2])
      #ax.imshow(sum(mr.records["V1Complex"]['activity']),cmap='gray')            

      #ax = pylab.subplot(gs[1,2])
      #ax.imshow(sum(mr.records["V1Simple"]['activity']),cmap='gray')            
    
def domains_stability_test(parameters,parameter_values,sheets,sheets_to_record,retina,reset_homeo,directory):
    from modelparametrization import ModelRecording,ModelParametrization
    mr = ModelRecording(sheets, retina, sheets_to_record = sheets_to_record, reset_homeo = reset_homeo)
    #return mr
    f = lambda : mr.present_stimulus_sequence(1.0,[None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None,None])
    mp = ModelParametrization(parameters,parameter_values,f,plot_domains_stability,{'mr' : mr},directory)
    mp.go(initial_run=True)

    

def check_RF_corrleation_vs_connection_weights_correlation():
    _check_RF_corrleation_vs_connection_weights_correlation(topo.sim["V1Simple"].projections()["LGNOnAfferent"],topo.sim["V1Simple"].projections()["LGNOnAfferent"],topo.sim["V1Simple"].projections()["L4EtoE"],topo.sim["LGNOn"],topo.sim["V1Simple"],topo.sim["V1Simple"])
    pylab.savefig(normalize_path('RF_connectivity_correlation_EE:' + str(topo.sim.time()) + '.png'));
    _check_RF_corrleation_vs_connection_weights_correlation(topo.sim["V1Simple"].projections()["LGNOnAfferent"],topo.sim["V1SimpleInh"].projections()["LGNOnAfferentInh"],topo.sim["V1SimpleInh"].projections()["L4EtoI"],topo.sim["LGNOn"],topo.sim["V1Simple"],topo.sim["V1SimpleInh"])
    pylab.savefig(normalize_path('RF_connectivity_correlation_EI:' + str(topo.sim.time()) + '.png'));
    _check_RF_corrleation_vs_connection_weights_correlation(topo.sim["V1SimpleInh"].projections()["LGNOnAfferentInh"],topo.sim["V1Simple"].projections()["LGNOnAfferent"],topo.sim["V1Simple"].projections()["L4ItoE"],topo.sim["LGNOn"],topo.sim["V1SimpleInh"],topo.sim["V1Simple"])
    pylab.savefig(normalize_path('RF_connectivity_correlation_IE:' + str(topo.sim.time()) + '.png'));
    _check_RF_corrleation_vs_connection_weights_correlation(topo.sim["V1SimpleInh"].projections()["LGNOnAfferentInh"],topo.sim["V1SimpleInh"].projections()["LGNOnAfferentInh"],topo.sim["V1SimpleInh"].projections()["L4ItoI"],topo.sim["LGNOn"],topo.sim["V1SimpleInh"],topo.sim["V1SimpleInh"])
    pylab.savefig(normalize_path('RF_connectivity_correlation_II:' + str(topo.sim.time()) + '.png'));

def _check_RF_corrleation_vs_connection_weights_correlation(source_sheet_afferent_projection,target_sheet_afferent_projection,projection,afferent_sheet,source_sheet,target_sheet):
    """
    It shows the relationship between the afferent connection correlations and the weight correlation in the given projection
    for the same neurons.
    """
    assert projection.cfs.shape == target_sheet_afferent_projection.cfs.shape
    
    
    corrs = []
    w = []
    
    def overlap(slice1,slice2):
        indexes1 = slice1.tolist()
        indexes2 = slice2.tolist()
        
        o = [max(indexes1[0],indexes2[0]),min(indexes1[1],indexes2[1]),max(indexes1[2],indexes2[2]),min(indexes1[3],indexes2[3])]  
        
        # Make sure there is overlap and that it is at least 4x4 in size
        if (o[0] < o[1]-4) and (o[2] < o[3]-4):
          return o  
        else:
          return None
    
    for i,cf1 in enumerate(target_sheet_afferent_projection.cfs.flatten()):
        z = projection.cfs.flatten()[i]
        indexes = z.input_sheet_slice.tolist()
        full_cf = numpy.zeros(source_sheet.activity.shape)
        full_cf[indexes[0]:indexes[1],indexes[2]:indexes[3]] = z.weights
        full_cf = full_cf.flatten()

        for j,cf2 in enumerate(source_sheet_afferent_projection.cfs.flatten()):
            if numpy.random.rand() < 0.01:
                indexes1 = cf1.input_sheet_slice.tolist()
                indexes2 = cf2.input_sheet_slice.tolist()
                
                o = overlap(cf1.input_sheet_slice,cf2.input_sheet_slice)
                if o != None:
                    
                    full_cf1 = numpy.zeros(afferent_sheet.activity.shape)
                    full_cf1[indexes1[0]:indexes1[1],indexes1[2]:indexes1[3]] =cf1.weights 
                    full_cf1 = full_cf1[o[0]:o[1],o[2]:o[3]]
                    
                    
                    full_cf2 = numpy.zeros(afferent_sheet.activity.shape)
                    full_cf2[indexes2[0]:indexes2[1],indexes2[2]:indexes2[3]] =cf2.weights 
                    full_cf2 = full_cf2[o[0]:o[1],o[2]:o[3]]
                    
                    
                    
                    corrs.append(numpy.corrcoef(full_cf1.flatten(),full_cf2.flatten())[0][1])
                else:
                    corrs.append(0)
                w.append(full_cf[j])
                
            
    pylab.figure()
    pylab.plot(corrs,w,'ro')
    pylab.xlabel('RF correlations')
    pylab.ylabel('Weight strength')


    
