            program q18

        real value,factorial_calculation_value_limit,value_limit,factorial_sum,counter

	value=1.0
	factorial_calculation_value_limit=20.0
	value_limit=100.0
	factorial_sum=0.0
	counter=0.0

	do while (value .lt. value_limit)	

		if (value .lt. factorial_calculation_value_limit) then

			factorial=1.0

			do j=1,value
				factorial=factorial*j
			end do

		end if

	if (value .gt. factorial_calculation_value_limit) then 
        factorial=0.0
        end if

        factorial_sum=factorial_sum+factorial

        print *,'VALUE',value,'   FACTORIAL',factorial

        value=2.0*value+1.0

        counter=counter+1.0


        end do

        print *,'ITERATIONS', counter
	print *,'FACTORIAL SUM',factorial_sum

            end
