def isochrone_fits(x,y,y_n_bins,x_n_bins):

	n=data1['int_IMF']

	y_bin_size=(max(y)-min(y))/y_n_bins
	x_bin_size=(max(x)-min(x))/x_n_bins

	y_bin=np.floor((y-min(y))/y_bin_size)
	x_bin=np.floor((x-min(x))/x_bin_size)

	for i in range(len(y)-1):

       		x_pair=[x_bin[i],x_bin[i+1]]
       		y_pair=[y_bin[i],y_bin[i+1]]
       		x1=int(x_pair[x_pair.index(min(x_pair))])
        	x2=int(x_pair[x_pair.index(max(x_pair))])
        	y1=int(y_pair[y_pair.index(min(y_pair))])
        	y2=int(y_pair[y_pair.index(max(y_pair))])
	
		for j in (np.arange(y2-y1+1)+y1):
			for k in (np.arange(x2-x1+1)+x1):
				if j < y_n_bins and k < x_n_bins:
					grid[j,k]=grid[j,k]+float(abs(n[i]-n[i+1])/((y2-y1+1)*(x2-x1+1)))

	hdu=fits.PrimaryHDU(grid)
	hdulist=fits.HDUList([hdu])
	hdulist.writeto('q25.fits')

import isochrones
import matplotlib.pyplot as plt
import numpy as np
import astropy.io.ascii as ascii
import astropy.io.fits as fits
import pylab
import pyfits

y_n_bins=50.0
x_n_bins=50.0

fixed_log_age=9

isochrones=['zp00.dat','zp01.dat','zp02.dat','zp03.dat','zp04.dat','zp05.dat','zm01.dat','zm02.dat','zm03.dat','zm04.dat','zm05.dat','zm06.dat','zm07.dat','zm08.dat','zm09.dat','zm10.dat','zm11.dat','zm12.dat','zm13.dat','zm14.dat','zm15.dat','zm16.dat','zm17.dat','zm18.dat','zm19.dat','zm20.dat']

grid=0.0*np.empty([y_n_bins,x_n_bins])

data1=ascii.read(isochrones[0],names=['Z','log_age','M_ini','M_act','log_L_Lo','log_Te','log_G','mbol','U','B','V','R','I','J','H','K','int_IMF','stage'])
idx_age=np.where(data1['log_age'] == fixed_log_age)

y=data1['log_L_Lo'][idx_age]
x=data1['log_Te'][idx_age]

isochrone_fits(x,y,y_n_bins,x_n_bins)

