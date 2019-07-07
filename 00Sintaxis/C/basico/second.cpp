#include<iostream>
#include<fstream>
#include<string>
#include<vector>

using namespace std;

//Funciones:

int addNums(int firstNum, int secNum =0){

  int suma=firstNum + secNum;
  return suma;
}
//Overloading (tener más de una funcion con mismo nombre, se puede. Pero debe tener distintos argumentos.

int factorial(int num){ //Funcion recursiva
  int sum;
  if(num == 1) sum =1;
  else sum= factorial(num-1)*num;
  return sum;
}

//Subrutinas:

void miSubrutina(arg1,arg2){
    //hace algo...
}
  // Si quiero que modifique las variables de entrada, entonces le paso sus memory adrresses (pointers) *variable
void miSubrutina2(*arg1,*arg2){

}

int main(){

  int n=9;

  cout << "Factorial de "<< n <<" es: " << factorial(n) << endl;

// Memoria:
int m=1;

cout <<"Tamaño bits:" <<sizeof(m) <<" Memory adress: "<< &m  << endl;
    // pointers:  &variable
    int* memadrr=&m;

    cout<<"Pointer:" << memadrr<<endl;
    cout<<"Derreferencio pointer:" << *memadrr<<endl;

  return 0;
}
