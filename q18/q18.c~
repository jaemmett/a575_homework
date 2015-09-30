#include <stdio.h>

int main()
{	
float value,factorial_calculation_value_limit,value_limit,factorial_sum,counter,factorial;
int i=0;

value=1.0;
factorial_calculation_value_limit=20.0;
value_limit=100.0;
factorial_sum=0.0;
counter=0.0;
factorial=0.0;

	while (value<value_limit)
	{
		if (value<factorial_calculation_value_limit)
		{
			factorial=1.0;

			for (i=1;i<=value;i++)
			{
				factorial=factorial*i;
			}
		}

		if (value>factorial_calculation_value_limit)
		{
			factorial=0.0;
		}

        factorial_sum=factorial_sum+factorial;

        printf("%s","VALUE   ");
        printf("%f",value);
        printf("%s","   FACTORIAL   ");
	printf("%f\n",factorial);

        ;value=2.0*value+1.0;

        counter=counter+1.0;
	
	}


        printf("%s","ITERATIONS   ");
	printf("%f\n",counter);
	printf("%s","FACTORIAL SUM   ");	
	printf("%f\n",factorial_sum);

}
