import isochrones
import matplotlib.pyplot as plt
import numpy as np
import astropy.io.ascii as ascii

fixed_log_age=9
fixed_metallicity=0.015200

data=ascii.read('zp00.dat',names=['Z','log_age','M_ini','M_act','log_L_Lo','log_Te','log_G','mbol','U','B','V','R','I','J','H','K','int_IMF','stage'])

print type(data['log_Te'])

idx_age=np.where(data['log_age'] == fixed_log_age)
idx_met=np.where(data['Z'] == 0.015200)

print data['Z']

print idx_met

plt.subplot(221)
plt.scatter(data['log_Te'][idx_age],data['log_G'][idx_age],c=data['Z'][idx_age],cmap='RdYlBu') 
plt.ylabel('log ($g_{sfc}$ [m/$s^{2}$])')
plt.colorbar().set_label('Z')

plt.subplot(223)
plt.scatter(data['log_Te'][idx_age],data['mbol'][idx_age],c=data['Z'][idx_age],cmap='RdYlBu')
plt.xlabel('log ($T_{eff}$ [K])')
plt.ylabel('log $m_{bol}$')
plt.colorbar().set_label('Z')

plt.subplot(222)
plt.scatter(data['log_Te'][idx_met],data['log_G'][idx_met],c=data['log_age'][idx_met],cmap='RdYlBu')
plt.colorbar().set_label('log (age [yr])')

plt.subplot(224)
plt.scatter(data['log_Te'][idx_met],data['mbol'][idx_met],c=data['log_age'][idx_met],cmap='RdYlBu')
plt.xlabel('log ($T_{eff}$ [K])')
plt.colorbar().set_label('log (age [yr])')

plt.show()

