import isochrones
import matplotlib.pyplot as plt
import numpy as np
import astropy.io.ascii as ascii
import astropy.io.fits as fits
import pylab
import pyfits

vector=np.arange(8192)
deltaf=np.arange(8192)
ones_idx=np.where(vector%10==0)
zeros_idx=np.where(vector%10!=0)
deltaf[ones_idx]=1.0
deltaf[zeros_idx]=0.0

convolution=np.zeros(8192)

mu,sigma=0.0,4.0
for i in range(50,200):
	gaussian=7.0*(1.0/(sigma*np.sqrt(2.0*np.pi)))*np.exp(-0.5*((vector[(i-20):(i+20)]-i)/sigma)**2.0)
        summ=0.0
        for j in range(40):
		summ=summ+gaussian[j]*deltaf[i+j]

        convolution[i]=summ
        print i

#print len(vector[(i-20):(i+20)]),len(gaussian[(i-20):(i+20)])

plt.plot(vector,deltaf)
#plt.plot(vector[(i-20):(i+20)],gaussian[(i-20):(i+20)])
plt.plot(vector[(0):(i+20)],convolution[(0):(i+20)])
plt.xlim(50.0,150.0)
plt.ylim(0.0,2.0)
plt.show()


