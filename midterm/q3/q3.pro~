FUNCTION f_x,x
	f=(x^3.0)+(x^(2.0/3.0))
	RETURN, f
END

FUNCTION simpson,a,b
	int=((b-a)/6.0)*(f_x(a)+4.0*f_x((a+b)/2.0)+f_x(b))
	RETURN, int
END

FUNCTION analytical_int,a,b
         an_int=((0.6*b^(5.0/3.0))+(0.25*b^4.0))-((0.6*a^(5.0/3.0))+(0.25*a^4.0))
         RETURN, an_int
END

pro q3

   ; (a)
	;The program passes an x value (3) to f_x
	;f_x returns the value of the function to the program
	;The program prints the returned value

	print,'(a)', f_x(3)

   ; (b)
	;The program passes lower and upper limits (a=1 and b=1) to simpson
        ;simpson returns the integral of the function defined in f_x from a to b
        ;the program prints the returned value

        print, '(b)', simpson(1,2)

   ; (c)   
	;The program passes lower and upper limits (a=1 and b=10) to simpson
        ;simpson returns the integral of the function defined in f_x from a to b
        ;the program prints the returned value

        print, '(c)', simpson(1,10)

        ;The program prints "2526.91"

   ; (d)
	;The program passes lower and upper limits (a=1 and b=10) to analytical_int
        ;analytical_int returns the true integral of the function defined in f_x from a to b
        ;using a hard-coded integrand.
        ;the program prints the returned value

        print, '(d)',analytical_int(1,10)

	;The program prints "2527.00". The Simpson/Analytical result = 99.9964%, 
        ; so the Simpson result is 0.0036% smaller than the analytical result.

   ; (e)
	;For 1 to 10 pieces, sum the integral of the function defined in f_x from
        ;the lower to upper bounds defined by the piece size.

        simpson_array=dblarr(10)
        for i=1,10 do begin

        	piece_size=10.0/i
        	n_pieces=10.0/piece_size
        	sum=0.0

        	for j=0,n_pieces do begin
        		sum=sum+simpson(i*piece_size,i*piece_size+piece_size)
        	endfor

        	simpson_array(i-1)=sum

        endfor

   ; (f)
	;Plot the fractional accuracy vs. number of pieces. There appears to be a coding
        ;issue which is producing incorrect sums and therefore incorrect fractional uncertainties.

        plot,indgen(10)+1,simpson_array/analytical_int(1,10),psym=-3,ytitle='FRACTIONAL UNCERTAINTY', xtitle='NUMBER OF PIECES',charsize=1.3

        ;Save finished plot as a .png file
        write_png,'q3png.png',tvrd(/true)
end
