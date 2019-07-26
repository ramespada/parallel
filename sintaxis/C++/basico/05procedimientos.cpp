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

void miSubrutina1(){
    cout<<"Soy una subrutina.."<<endl;
}
  // Si quiero que modifique las variables de entrada, entonces le paso sus memory adrresses (pointers) *variable
void miSubrutina2(int *arg1, int *arg2){
	*arg1=*arg1*2;
	*arg2=*arg2*3;
	
	return;
}

int main(){

  int n=9,m=2;

  cout << "Factorial de "<< n <<" es: " << factorial(n) << endl;
  miSubrutina1();
  cout<<"m="<<m<<" n="<<n<<endl; 	
  miSubrutina2(&n,&m);
  cout<<"m="<<m<<" n="<<n<<endl; 	
  
	cout << "Factorial de "<< n <<" es: " << factorial(n) << endl;
    // Memoria:

    cout <<"Tamaño bits:" <<sizeof(m) <<" Memory adress: "<< &m  << endl;
    // pointers:  &variable
    int* memadrr=&m;

    cout<<"Pointer:" << memadrr<<endl;
    cout<<"Derreferencio pointer:" << *memadrr<<endl;

  return 0;
}
