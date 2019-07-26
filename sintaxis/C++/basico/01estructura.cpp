// Comentario
/*
  Multilinea comentario
	Compilar:
		g++ script.cpp
	Correr:
		./a.out
*/
#include<iostream>

//Todo va dentro de una función principal (main)
int main(){ 


  //Definicion de variables:
    bool booleano = true;
    int  entero = 1;
    float real = 3.141592;
    double doble= 1.123123123123;
    char letra='a';
   
  //Indicaciones:
  std::cout << "Hola mundo!"<< std::endl;
  std::cout << booleano << std::endl; 
  std::cout << entero << std::endl; 
  std::cout << real << std::endl; 
  std::cout << doble << std::endl; 
  std::cout << letra << std::endl; 

  
  return 0;
}
