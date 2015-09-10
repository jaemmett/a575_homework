pro reentry

;CONSTANTS
	radius_earth=6.371e6        ;m
        mass_earth=5.972e24         ;kg
        omega_earth=0.004178071     ;deg/sec
        grav_constant=6.67384e-11   ;m3/kg/s2

;INITIAL TRAJECTORY
        inclination=51.6            ;deg N
	alt_initial=160935.0        ;m
        lon_initial=0.0             ;deg E
        lat_initial=0.0             ;deg N
        azi_initial=90.0            ;deg CW from N
        ele_initial=-1.5            ;deg Up
        vel_initial=7676.0          ;m/s
        area_capsule=2.83529        ;m2
        mass_capsule=1452.0         ;kg

;SIMULATION CONDITIONS
        dt=0.1                      ;s
        sim_time=3000.0             ;s

;PARAMETERS
        geo_coords_initial=[lon_initial,lat_initial,alt_initial+radius_earth]
        geo_pos_initial= CV_COORD(FROM_SPHERE=geo_coords_initial, /TO_RECT, /DEGREES)
        topo_dir_initial=[-cos(!DtoR*ele_initial)*cos(!DtoR*azi_initial),cos(!DtoR*ele_initial)*sin(!DtoR*azi_initial),sin(!DtoR*ele_initial)]
        geo_dir_initial=vecrot3d(topo_dir_initial,0.0,90.0-lat_initial,lon_initial)
        geo_dir_initial=geo_dir_initial/sqrt(geo_dir_initial[0]^2+geo_dir_initial[1]^2+geo_dir_initial[2]^2)
        geo_vel_initial=geo_dir_initial*vel_initial
        geo_acc_initial=[0.0,0.0,0.0]
	geo_vel=geo_vel_initial
	geo_pos=geo_pos_initial
        geo_acc=geo_acc_initial

	geo_vel=geo_vel+0.5*geo_acc*dt
	geo_pos=geo_pos+geo_vel*dt 

geo_pos_array=dblarr(4,sim_time/dt+1)
geo_vel_array=dblarr(4,sim_time/dt+1)
geo_acc_array=dblarr(4,sim_time/dt+1)

for i=1,sim_time/dt do begin

geo_pos_mag=sqrt(geo_pos(0)^2+geo_pos(1)^2+geo_pos(2)^2)
geo_vel_mag=sqrt(geo_vel(0)^2+geo_vel(1)^2+geo_vel(2)^2)
geo_acc_mag=sqrt(geo_acc(0)^2+geo_acc(1)^2+geo_acc(2)^2)


if geo_pos_mag-radius_earth gt 25000.0 then temp=-131.21+0.00299*(geo_pos_mag-radius_earth)
if geo_pos_mag-radius_earth gt 25000.0 then press=2.488*((temp+273.1)/216.6)^(-11.388)

if geo_pos_mag-radius_earth gt 11000 and geo_pos_mag-radius_earth lt 25000 then temp=-56.46
if geo_pos_mag-radius_earth gt 11000 and geo_pos_mag-radius_earth lt 25000 then press=22.65*exp(1.73-0.000157*(geo_pos_mag-radius_earth))

if geo_pos_mag lt 11000 then temp=15.04-0.00649*(geo_pos_mag-radius_earth)
if geo_pos_mag lt 11000 then press=101.29*((temp+273.1)/288.08)^5.256

rho=press/(0.2869*(temp+273.1))
f_drag=(-0.5*1.45*rho*area_capsule*(geo_vel_mag)^2.0)*(geo_vel/geo_vel_mag)
;f_drag=0.0


geo_acc=(-grav_constant*mass_earth*geo_pos/sqrt(geo_pos(0)^2+geo_pos(1)^2+geo_pos(2)^2)^3) + f_drag/mass_capsule
geo_pos=geo_pos+geo_vel*dt
geo_vel=geo_vel+geo_acc*dt

geo_pos_array(0,i)=geo_pos(0)
geo_pos_array(1,i)=geo_pos(1)
geo_pos_array(2,i)=geo_pos(2)
geo_pos_array(3,i)=geo_pos_mag

geo_vel_array(0,i)=geo_vel(0)
geo_vel_array(1,i)=geo_vel(1)
geo_vel_array(2,i)=geo_vel(2)
geo_vel_array(3,i)=geo_vel_mag

geo_acc_array(0,i)=geo_acc(0)
geo_acc_array(1,i)=geo_acc(1)
geo_acc_array(2,i)=geo_acc(2)
geo_acc_array(3,i)=geo_acc_mag

if geo_pos_mag lt radius_earth then break

endfor

window,0,xsize=1500,ysize=1100
!P.Color = '000000'xL
!P.Background = 'FFFFFF'xL
loadct,39
!P.MULTI = [0, 2, 2]
;plot,[0],[0],xrange=[0.0,max(geo_pos_array(1,0:i-1))],yrange=[min(geo_pos_array(1,100:i-1)),max(geo_pos_array(0,0:i-1))],/iso
plot,[0],[0],xrange=[-1.1*radius_earth,1.1*radius_earth],yrange=[-1.1*radius_earth,1.1*radius_earth],/iso,xstyle=1,ystyle=1
oplot,radius_earth*cos(findgen(2.0*!pi*1000.0)/1000.0),radius_earth*sin(findgen(2.0*!pi*1000.0)/1000.0)

for j=0,i-1 do begin
oplot,[geo_pos_array(1,j)],[geo_pos_array(0,j)],psym=3
;wait,0.001
endfor

print,max(geo_pos_array[1,*])
print,max(geo_acc_array[3,*]/9.8)
print,geo_acc_array[3,sim_time/dt]/9.8

oplot,[geo_pos_initial[1]],[geo_pos_initial[0]],psym=3

plot,dt*findgen(n_elements(geo_acc_array(1,0:i)))/60.0,geo_acc_array(3,*)/9.8,psym=-3,xtitle='TIME (min)',ytitle='ACCEL (G)',xstyle=1,ystyle=1

plot,dt*findgen(n_elements(geo_acc_array(1,0:i)))/60.0,geo_pos_array(3,*)-radius_earth,psym=-3,yrange=[0,2.0e5],ystyle=1,xstyle=1,xtitle='TIME (min)',ytitle='ALTITUDE (m)'

plot,dt*findgen(n_elements(geo_vel_array(1,0:i)))/60.0,geo_vel_array(3,*),psym=-3,xtitle='TIME (min)',ytitle='VELOCITY (m/s)',xstyle=1,ystyle=1


end
