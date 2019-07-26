 // Comentario
 /*
  Multilinea comentario
  

Compilar:
	g++ script.cpp
Correr:
	./a.out
  */

#include<iostream>
#include<vector>
#include<string>
#include<fstream>

using namespace std; //Pa no esecificar c/vez que uso una fun de una lib "std::funcion"


//Todo va dentro de una función principal (main)
int main(){ 

  cout << "Hola mundo!"<< endl; //print hola mundo.

  //Datatypes:
    bool booleano = true;
    int  entero = 1;
    float real = 3.141592;
    double doble= 1.123123123123;
    char letra='a';
   
   
  /* Operaciones:
    - Lógicas: &(and) |(or) !(not)
    - Operadores: == != < > <= >= 
    - Aritmetica: + - * / pow() sqrt() %
    - Intrinsecas: funcion1(arg1,arg2)
  */

  /*Casting":
  Cuando queremos cambiar el tipo de dato que resulta de una opeación:*/
  int a=3, b=2;
   cout<< 3/2 << endl;        //retorna 1
   cout<<(float) 3/2 << endl; //retorna 1.5
  

  /*Controladores:
IF:
    if ( <condicion> ){
      <Hace algo>
    }
    else if( <otra condicion> ){
      hace otra cosa
      }
    else( <En cualquier otro caso hace esto.> )

FOR:
    char palabra[5] = {'c','i','n','c','o'};
    int i;
    for (int i=0;i<5;i++){
     cout<< palabra[i];
     }
    cout<<endl;


WHILE:   
  WHILE( <CONDICION> ){
    HACER ALGO..  
  }
 
 */


  /*
STRINGS:
   Usando el modulo <string>

   string minombre= "Ramiro";
   
I/O (no me anda)
   double num;
   string numStr;

   cout << "Dame un numero..";
   getline(cin, numStr);
   num = stod(numStr);
    
    if (num <=10 & num > 0){
      cout <<"Lindo número!" << endl;
    }
    else{
      cout <<"No me gusta :(" << endl;
    }
*/
   
/*
ARRAYS
  Usando modulo <vector>

 
 */
  return 0;
}
