#include <stdio.h>
#include <string.h>


int main(){
           
	//Esto es un comentario
          
        //Declaracion de variables:
        char nombre[10] = "estimado";
	
	//Instrucciones del programa:
        printf("Cual es tu nombre? ");	//stdout
        scanf("%s",nombre);		//stdin
        
	printf("Hola %s! Todo tranqui?\n",nombre);
        
   	return 0;	
}