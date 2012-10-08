from LSCSMNEW import loadBestResults
import numpy

l = loadBestResults()
globals().update(l)

print numpy.shape(raw_validation_set)
