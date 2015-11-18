import isochrones
import matplotlib.pyplot as plt
import numpy as np
import astropy.io.ascii as ascii
import astropy.io.fits as fits
import pylab
import pyfits

min_mass=0.5
max_mass=100.0
exponent=-2.35
n_stars=1000

mass_sample=np.arange(min_mass,max_mass,(max_mass-min_mass)/n_stars)
dndm_sample=mass_sample**exponent
uni_deviates=np.random.uniform(0,1,n_stars)
act_deviates=0.0*uni_deviates

cume_dndm_mass=np.zeros(len(mass_sample))

cume=0.0
for i in range(len(cume_dndm_mass)):
	cume=cume+dndm_sample[i]
	cume_dndm_mass[i]=cume

for i in range(len(cume_dndm_mass)):
	act_deviates[i]=mass_sample[cume_dndm_mass.index(min(abs(cume_dndm_mass-uni_deviates[i])))]



#act_deviates=((min_mass**-1.35)-1.35*uni_deviates)**(-1.0/1.35)
#mass_dist=n_stars*act_deviates

print act_deviates
#plt.hist(act_deviates,bins=50)
#plt.plot(mass_sample,dndm_sample)
#plt.show()
