#include<iostream>
#include<string>
#include<sstream>

using namespace std; //Pa no esecificar c/vez que uso una fun de una lib "std::funcion"

/* INPUT/OUTPUT
	cin :  stdin
	cout:  stdout
	cerr:  stderr
	clog:  stdlog
*/
int main(){ 
	string nombre;
	int edad;

  //stdin 
  cout << "Edad: ";	cin >> edad;
  cout << "Nombre: ";	cin >> nombre;
	//edad=28;
	//nombre="Ramiro";

  //stout
  cout << "Hola mundo!"<< endl;
	//concatenacion:
  cout << "Me llamo "<<nombre<<". Y tengo "<<edad<<" años."<<endl;
 

  //StreamString 	<sstream>
  	string mi_string;
	float precio=0;
	int   cantidad=0;
	
	cout << "Intrudzca cantidad: ";
	getline(cin, mi_string);
	stringstream(mi_string) >> cantidad;

	cout << "Intrudzca precio: ";
	getline(cin, mi_string);
	stringstream(mi_string) >> precio;

	cout<<"Precio final: "<< precio*cantidad <<endl;

return 0;
}
