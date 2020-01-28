#include <stdio.h>

//function
float suma(float arg1, float arg2){
	return arg1 + arg2;
}
 

//subroutine
void suma2(float arg1, float arg2, float *arg3) {
	 *arg3=arg1+arg2;
}



int main(){
	float a, b, c;
        a=1.;
        b=2.;
        c=0.;
        
	printf("%4f + %4f  = %4f\n",a,b,suma(a,b));
               
        suma2(a,b,&c);
	
	printf("%4f\n",c);
 
	return 0;	
}
