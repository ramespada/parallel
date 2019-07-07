#include<string>


//Clases:
class Animal{
  private: //solo pueden ser cambiadas por funciones dentro de mi clase.
    float height;
    float wight;
    string name;

    static in numOfAnimals;

  public:// pueden ser modificadas externamente.
    int getHeight(){ return height};
    int getWeight(){ return weight};
    int getName(){ return name};
    
    void setHeight(){int altura}{height = altura};
    void setWeight(){int peso}{weight = peso};
    void setName(){string nombre}{name = nombre};

    void setAll(int,int,string)
    //Constructor:
    Animal(int,int,string);


}


int main(){



  return 0;
}
