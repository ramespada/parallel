#include<iostream>
#include<string>
#include<cmath>

using namespace std; //Pa no esecificar c/vez que uso una fun de una lib "std::funcion"

int main(){ 

//D A T A    T Y P E S:

	//BOOLEANOs:
    bool p=true,q;
    q=false;

    cout << p    << endl; 
    cout << ((p|q) & !q)  << endl; //op. logicas (!:not  &:and  |:or)

	//ENTEROs
    int n=-4,m;
    m=3;

    cout << (n/2+m*3)  	     << endl; //aritmeticas      (+  - * /)
    cout << (n == m)         << endl; //op. relacionales (== != > < >= <= )
    cout << abs(n)     	     << endl; //modulo 
    cout << n%m		     << endl; //op. modular

	//PUNTO FLOTANTE:
    float  x = 3.141592;
    double xx= 1.123123123123;

    cout << pow(x,2)	     << endl; //potencia
    cout << sqrt(xx)	     << endl; //raiz cuadrada

	//CHARACTER
    char   letra='a';
 
	//STRINGS	   Usando el modulo <string>
    string minombre= "Ramiro";   

 
// Casting":  Cuando queremos cambiar el tipo de dato que resulta de una opeación:
  int a=3, b=2;
  cout<< 3/2 << endl;        //retorna 1
  cout<<(float) 3/2 << endl; //retorna 1.5
  


 return 0;
}
