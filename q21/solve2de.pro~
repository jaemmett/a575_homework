;First, first order differential equation
;x=independent variable, y=f(x), z=f'(x)

	FUNCTION diff_eq1,x,y,z
		RETURN,z
	END


;Second, first order differential equation
;x=independent variable, y=f(x), z=f'(x)

	FUNCTION diff_eq2,x,y,z
		RETURN,-(1.0/x^2.0)*(2.0*x*z+(x^2.0)*y^2.5)
	END


;Solve a system of two first order differential equations,
;returning e=independent variable, y=f(e), and z=f'(e)

	FUNCTION RK,h,de,eval,y,z,e_arr,y_arr,z_arr

      	  e=de
        
		for i=1,eval/h do begin
			e=e+h
			k0=h*diff_eq1(e,y,z)
                	l0=h*diff_eq2(e,y,z)
			k1=h*diff_eq1(e+h/2.0,y+k0/2.0,z+l0/2.0)
			l1=h*diff_eq2(e+h/2.0,y+k0/2.0,z+l0/2.0)
			k2=h*diff_eq1(e+h/2.0,y+k1/2.0,z+l1/2.0)
                	l2=h*diff_eq2(e+h/2.0,y+k1/2.0,z+l1/2.0)
			k3=h*diff_eq1(e+h,y+k2,z+l2)
               	        l3=h*diff_eq2(e+h,y+k2,z+l2)
			y=y+(1.0/6.0)*(k0+2.0*k1+2.0*k2+k3)
               	        z=z+(1.0/6.0)*(l0+2.0*l1+2.0*l2+l3)
                	if ~(y>0) then break

                	e_arr[i]=e
                	y_arr[i]=y
                	z_arr[i]=z
        	endfor

		RETURN,i
	END	


;Solve the Lane-Emden polytrope equation
;by applying the Runge-Kutta algorithm

pro solve2de
        

;Define the polytropic index (n), time step (h),
;initial independent variable value (de), and maximum independent variable value (eval)
   
        n=2.5				
	h=0.01
	de=0.001
        eval=10.0


;Define arrays for storage of computed solutions

        e_arr=dblarr(10000)
        y_arr=dblarr(10000)
        z_arr=dblarr(10000)


;Compute the initial f(x) (y_init) and f'(x) (z_init) values,
;by Taylor expanding about x=0

	y_init=1-(1./6.)*(de^2.)+(n/120.)*(de^4.)-((n*(8.*n-5.))/15120.)*de^6.
	z_init=(-1./3.)*de+(n/30.)*(de^3.)-((n*(8.*n-5.))/2520.)*de^5.


;Compute the solution by applying the Runge-Kutta algorithm function

        e=de
	y=y_init
        z=z_init

	y=RK(h,de,eval,y,z,e_arr,y_arr,z_arr)


;Plot the solution and other parameters in the same plot window

        window,0,xsize=600,ysize=600
	!P.Color = '000000'xL
	!P.Background = 'FFFFFF'xL
	loadct,39
        plot,e_arr,y_arr,psym=3,xrange=[0,7],yrange=[0,1.2],xstyle=1,ystyle=1,xtitle='Epsilon',title=string('Lane-Emden n =',n),charsize=1.3  
        oplot,e_arr,y_arr^n,psym=3
        oplot,e_arr,y_arr^(n+1.0),psym=3


;Compute and overplot various constants and physical parameters
                
;q parameter

        e1=e_arr[534]
        y1=y_arr[534]
        z1=z_arr[534]
        q=((e_arr^2.0)*z_arr)/((e1^2.0)*z1)
        oplot,e_arr,q,psym=3


;Solar constants
        
        m_sun=1.989e33     ;g
        r_sun=6.96e10      ;cm
        grav_const=6.67e-8 ;cm^3/g/s


;Central density of the Sun
      
        rho_c_sun=(-e1/3.0)*(m_sun/((4.0/3.0)*!pi*(r_sun^3.0)))/z1


;Central pressure of the Sun
        
        n_const=(((4.0*!pi)^(1.0/n))/(n+1.0))*(((-e1^((n+1.0)/(n-1.0)))*z1 )^((1.0-n)/n))
        k_const=n_const*grav_const*(m_sun^((n-1.0)/n))*(r_sun^((3.0-n)/n))
        
        p_c_sun=k_const*(rho_c_sun^((n+1.0)/n))

;'Theta' constant and central temperature of the Sun
        
        theta_const=1.0/(-(n+1.0)*e1*z1)
        x_c_sun=0.7
        z_c_sun=0.02
        m_u=1.0/(0.7*2.0+0.28*(3.0/4.0)+0.02/2.0)
        mu_c_sun=0.02e-22 ;g
        k_b=1.38e-16 ;erg/k
        
        temp_c_sun=(theta_const*grav_const*m_sun*mu_c_sun*m_u)/(k_b*r_sun)


;'W' constant and average density of the Sun

        w_const=(4.0*!pi*(n+1.0)*z1^2.0)^(-1.0)

        rho_avg_sun=-(3.0/e1)*z1*rho_c_sun


;Print computed constants and parameters
        
        print,'Xsi 1',e1
        print,'Z 1',z1
        print,'Rho_central/Rho_avg',rho_c_sun/rho_avg_sun
        print,'N_n',n_const
        print,'W_n',w_const
        print,'Theta_n',theta_const
        print,'Central Density [g/cm^3]',rho_c_sun
        print,'Central Pressure [dyne/cm^2]',p_c_sun
        print,'Central Temperature [K]',temp_c_sun

;Save finished plot as a .png file

        write_png,'comp2.png',tvrd(/true)

end
