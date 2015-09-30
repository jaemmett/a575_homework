pro q18

value=1.0
factorial_calculation_value_limit=20.0
value_limit=100.0
factorial_sum=0.0
counter=0.0

while value lt value_limit do begin

	if value lt factorial_calculation_value_limit then begin

		factorial=1.0

		for j=1,value do begin
			factorial=factorial*j
		endfor

        endif

	if value gt factorial_calculation_value_limit then factorial=0.0

        factorial_sum=factorial_sum+factorial

        print,'VALUE',value,'   FACTORIAL',factorial

        value=2.0*value+1.0

        counter=counter+1.0

endwhile

        print,'ITERATIONS', counter
	print,'FACTORIAL SUM',factorial_sum

end
