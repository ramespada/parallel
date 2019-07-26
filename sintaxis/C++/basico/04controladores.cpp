#include<iostream>
#include<vector>

using namespace std; 

//CONTROLADORES DE FLUJO:

int main(){ 
	int n;
        cout << "Inserte un numero:";
	cin>> n;
//	IF:
    if ( n%2 == 0 ){
      cout << "n es par."<<endl;
    }
    else if( n%2 != 0 ){
      cout << "n es impar."<<endl;
    }
    else( cerr<<"input invalido!");

//	FOR:
    char palabra[5] = {'c','i','n','c','o'};
    int i;
    for (int i=0;i<5;i++){
     cout<< palabra[i]<<endl;
     }
    cout<<endl;


//	WHILE:
	n=0;
  	while(n<=10){
		cout<< n<<endl;
		++n;
	 }

  return 0;
}
