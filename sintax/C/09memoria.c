#include <stdio.h>

int main () {

   int  var = 20;   /* actual variable declaration */
   int  *ip;        /* pointer variable declaration */

   ip = &var;  /* store address of var in pointer variable*/

   printf("Valor de var: %d\n", var  );
   printf("Address de var: %x\n", &var  );

   /* address stored in pointer variable */
   printf("Address guardada en la variable ip: %x\n", ip );

   /* access the value using the pointer */
   printf("Value de *ip: %d\n", *ip );

   return 0;
}
