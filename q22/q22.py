import isochrones
from astropy.io import ascii
from numpy import where

def read_iso(f_in,single_age):
  iso=ascii.read(f_in,names=['metallicity','log_age','i_mass','c_mass','log_lum','log_teff','log_g','m_bol','u','b','v','r','i','j','h','k','int_IMF','stage'])
  single_age_iso=iso[where(iso['log_age']==single_age)]
  f_out=open('output.txt','w')
  f_out.write('{}'.format(single_age_iso)+"\n")
  return single_age_iso
  
read_iso('zp00.dat',9)