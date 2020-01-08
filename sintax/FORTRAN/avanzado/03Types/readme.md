# TYPES

> Types y Programacion orientada a objetos

# Parte 1: Reutilizabilidad de codigo

Un concepto central de la **programacion orientada a objetos (POO)** es el de *polimorfismo*, este se refiera la generacion de componentes de codigo (variables o procedimientos) flexibles y reutilizables en distintos contextos y programas. La idea es *write once, run many*. 

La POO describe una forma de programar donde el programa es visto como una coleccion de componentes independientes que interactuan ente si. Estos componentes son conocidos como *objetos*, y generalmente son entidades que encapsulan tanto variables (datos) y procedimientos.
º
## 2. Objectos en Fortran 90/95/2003

Los ``module`` podrian ser vistos como objetos dado que encapsulan variables y procedimientos. En Fortran 2003 (F2003) se incorporo la habilidad de crear un *derived type* capaces de encapsualr procedimientos y variables, por lo tanto estos pueden ser considerados objetos.

F2003 tambien introdujo *extension* de derived types. Esto posibilito explotar la propiedad de **herencia** (inheritance). Las herencias permiten la reusabilidad de codigo atraves de un link implicito de herencia en el cual objetos especificos (conocidos como hijos) reusan componentes de objetos mas generales (padres o ancestros). Por ejemplo:

```fortran
type forma
    integer :: color
    logical :: relleno
end type forma

type, extends(forma) :: rectangulo
    integer :: largo
    integer :: ancho
end type rectangulo

type, extends(rectangulo) :: cuadrado
end type cuadrado
```
En este ejemplo el type ``cuadrado`` hereda componentes de ``rectangulo`` que a su vez hereda otros de ``forma``. La relacion de herencia se indica con la sentencia **``EXTENDS``** seguido del tipo padre entre parentesis. Un type que extiende a otro se denomina **type extension**. Un type que no extiende a nadie se llama **base type**.

Un type extendido hereda todos los componentes de sus padres, pero tambien puede agregar nuevos componentes. 

El acceso a los componentes de los ``types`` lleva la siguiente sintaxis:
```fortran
type(square) :: sq           ! declara sq como un objeto cuadrado

sq%color                     ! acceso al componente color 
sq%rectangle%color           ! idem
sq%reactangle%shape%color    ! idem
```
Se puede ver que hay distintas formas de acceder a un mismo componente. Esto es porque los types extendidos incluyen componentes con el mismo nombre y tipo que sus ancestros.
Se dice que la relacion entre objetos hijos y padres hay una relacion de "es un", esta relacion tiene un solo sentido (de hijos a padres).


## Polimorfismo
La sentencia **``CLASS``**  permite crear variables polimorficas, estas son variables cuyo datatype puede ser modificado durante la corrida. Debe ser un un ``pointer``, ``allocatable`` o un *dummy argument*. Por ejemplo:

```fortran
class(shape), pointer :: sh
```
En este ejemplo el objeto ``sh`` puede ser un puntero a un ``shape``  o cualquier otro type extension, incluso uno que sea definido posteriormente en el codigo.

Hay dos tipos basicos de polimorfismo: **de procesos** y **de datos/variables**. El primero es el de procedimientos que pueden operar en una variedad de data types y valores. El segundo esta vinculado a variables que pueden guardar y operar en una variedad de datatypes y valores.

## Polimorfismo de procedimientos

Este polimorfismo ocurre cuando un procedimiento como una ``function`` o ``subroutine`` puede tomar una variedad de data types como argumentos. Y en F2003 esto puede realizarse cuando los dummy arguments de un procedimiento es declarado conla sentencia **``CLASS``**. Por ejemplo:

```fortran
subroutine setColor(sh, color)
    class(shape) :: sh
    integer :: color
    sh%color = color
end subroutine setColor
```
En este ejemplo la subrutina ``setColor`` toma dos argumentos: ``color`` y ``sh``, el segundo hace a la subrutina polimorfica ya que puede operar sobre cualquier objeto que satisfaga la relacion "es un"*shape*.

Si queremos que la subrutina aceda a componentes propios de un objeto hijo utilizamos la sentencia **``SELECT TYPE``**. Por ejemplo:

```fortran
subroutine initialize(sh, color, filled, x, y, length, width)
    ! initialize shape objects
    class(shape) :: sh
    integer :: color
    logical :: filled
    integer :: x,y
    integer, optional :: length,width

    sh%color = color
    sh%filled = filled
    sh%x = x
    sh%y = y
    
    select type (sh)
    type is (shape)
        ! no further initialization required
    class is (rectangle)
        ! rectangle or square specific initializations
        if (present(length))  then
           sh%length = length
        else
           sh%length = 0
        endif
        if (present(width)) then
            sh%width = width
        else
            sh%width = 0
        endif
    class default
      ! give error for unexpected/unsupported type
         stop 'initialize: unexpected type for sh object!'
    end select
    
end subroutine initialize
```
En este ejemplo se ve que que la construccion **``SELECT TYPE``** permite realizar un checkeo de type a un objeto para luego realizar acciones sobre este en funcion del resultado.

## Polimorfismo de procesos Type-Bound 
Veamos como agregar procedimientos asociados a un type:

```fortran 
type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure :: initialize
end type shape
```

F2003 agrego la sentencia ``contains`` para separar los procedimientos de la definicion de variables dentro de un derived type
La sintaxis de un procedimiento type-bound es:

```fortran
PROCEDURE [(interface-name)] [[,binding-attr-list ]::] binding-name[=> procedure-name]
```
Lo que esta en llaves es considerado opcional. Lo unico obligatorio es definir el nombre del procedimiento type-bound.

La primer opcion es llamado ``interface-name``. 

La opcion ``binding-attr-list`` es una lista de ``binding-attributes``. Los ``binding-attributes`` basicos son: **``PASS``**, **``NOPASS``**, **``NON_OVERRIDABLE``**, **``PUBLIC``** y **``PRIVATE``** y **``DEFERRED``**.

El procedure-name es el nombre del procedimiento subyacente implementado por el procedimiento type-bound.  Es requerido solo si el nombre de ambos difiere.

En nuestro ejemplo ``binding-name`` es ``initialize``.El ``procedure-name`` no fue especificad. Otra forma de escribir el ejemplo hubiera sido: ``procedure :: initialize => initialize``.

Aqui hay un ejempplo del suo de un type-bound procedure que utiliza un module procedure:

```fortran
module shape_mod

type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure :: initialize
end type shape

type, extends(shape) :: rectangle
        integer :: length
        integer :: width
end type rectangle

type, extends(rectangle) :: square
end type square

contains

subroutine initialize(sh, color, filled, x, y, length, width)
    ! initialize shape objects
    class(shape) :: sh
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
    integer, optional :: length
    integer, optional :: width

    sh%color = color
    sh%filled = filled
    sh%x = x
    sh%y = y
    
    select type (sh)
    type is (shape)
          ! no further initialization required
    class is (rectangle)
        ! rectangle or square specific initializations
        if (present(length))  then
           sh%length = length
        else
           sh%length = 0
        endif
        if (present(width)) then
            sh%width = width
        else
            sh%width = 0
        endif
    class default
      ! give error for unexpected/unsupported type
         stop 'initialize: unexpected type for sh object!'
    end select
    
end subroutine initialize

end module
```
Aqui un ejemplo en el que un type-bound procedure usa un external procedure con interface explicita:

```fortran
module shape_mod

type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure :: initialize
end type shape

type, extends(shape) :: rectangle
    integer :: length
    integer :: width
end type rectangle

type, extends(rectangle) :: square
end type square

interface
    subroutine initialize(sh, color, filled, x, y, length, width)
        import shape
        class(shape) :: sh
        integer :: color
        logical :: filled
        integer :: x
        integer :: y
        integer, optional :: length
        integer, optional :: width
  end subroutine
end interface

end module
```
Utilizando este ejemplo podemos invocar un type-bound procedure de la siguiente forma:

```fortran
use shape_mod
type(shape) :: shp                       ! declare an instance of shape
call shp%initialize(1, .true., 10, 20)   ! initialize shape
```
La sintaxis para invocar un type-bound procedure es muy similar a acceder a una componente de un derived type. 

Notar que el primer argumento definido en la subrutina es ``shp``, sin embargo este no aparece como argumento cuando llamamos a la subrutina. Este dummy argument es conocido como el *passed-object dummy argument*. Por default este es el siempre el primer argumento del procedimiento. Solamente recive el objeto que invoca al type-bound procedure.

El passed-object dummy argument debe ser declarado **``CLASS``** y debe teener el mismo type que el derived type definido en el type-bound procedure. 

Podemos especificar diferentes passed-object dummy argument usando la sentencia **``PASS``** como binding-attribute. Por ejemplo si queremos que ``sh`` no aparezca como primer argumento, entonces podriamos necesitar especificar un *PASS* attribute como el siguiente:

```fortran
type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure, pass(sh) :: initialize
end type shape
```
Aveces si no queremos especificar un passed-object dummy argument. Podemos elegir no especificarlo utilizando el **``NOPASS``** binding-attribute:

```fortran
type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure, nopass :: initialize
end type shape
```
Esto es lo mismo que cuando no especificabamos **PASS**, solo que cuando querramos utilizar el procedimiento vamos a tener que explicitamente poner como argumento el derived type:

```fortran
type(shape) :: shp                            ! declare an instance of shape
call shp%initialize(shp, 1, .true., 10, 20)   ! initialize shape
Note that we explicitly specify shp for the first argument of initialize because it was declared NOPASS.
```

##  Herencia y Type-Bound Procedures
Como ya vimos, los types hijos heredas componentes de sus ancestros. Esto aplica tanto a procedimientos como a datos. Por ejemplo:

```fortran
type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure :: initialize
end type shape

type, extends(shape) :: rectangle
    integer :: length
    integer :: width
end type rectangle

type, extends(rectangle) :: square
end type square
```
Usando este ejemplo podemos invocar  ``initialize`` para los objetos shape, rectangle o square:

```fortran
type(shape) :: shp                                  ! declare an instance of shape
type(rectangle) :: rect                             ! declare an instance of rectangle
type(square) :: sq                                  ! declare an instance of square
call shp%initialize(1, .true., 10, 20)              ! initialize shape
call rect%initialize(2, .false., 100, 200, 50, 25)  ! initialize rectangle
call sq%initialize(3, .false., 400, 500, 30, 20)    ! initialize rectangle
```

## 7. Procedure Overriding
Muchos lenguajes orientados a objetos permiten que los objetos hijos sobrescriban un procedimiento heredado de sus ancestros. Esto se conoce como *procedure overriding*. En F2003, podemos hacer simplemente creando en el objeto hijo un type-bound procedure con el mismo binding-name que el de su ancestro. Por ejemplo:
```fortran
module shape_mod
type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure :: initialize => initShape
end type shape

type, extends(shape) :: rectangle
    integer :: length
    integer :: width
contains
    procedure :: initialize => initRectangle
end type rectangle

type, extends(rectangle) :: square
end type square

contains

    subroutine initShape(this, color, filled, x, y, length, width)
        ! initialize shape objects
        class(shape) :: this
        integer :: color
        logical :: filled
        integer :: x
        integer :: y
        integer, optional :: length  ! ingnored for shape
        integer, optional :: width   ! ignored for shape

        this%color = color
        this%filled = filled
        this%x = x
        this%y = y
    end subroutine initShape

    subroutine initRectangle(this, color, filled, x, y, length, width)
        ! initialize rectangle objects
        class(rectangle) :: this
        integer :: color
        logical :: filled
        integer :: x
        integer :: y
        integer, optional :: length  
        integer, optional :: width   

        this%color = color
        this%filled = filled
        this%x = x
        this%y = y

        if (present(length)) then
           this%length = length
        else
           this%length = 0
        endif
        if (present(width)) then 
            this%width = width
        else
             this%width = 0
        endif

    end subroutine initRectangle
    
end module
```

In the sample code above, we defined a type-bound procedure called ``initialize`` for both ``shape`` and ``rectangle``. The only difference is that ``shape``'s version of initialize will invoke a procedure called ``initShape`` and ``rectangle``'s version will invoke a procedure called ``initRectangle``. Note that the passed-object dummy in ``initShape`` is declared ``class(shape)`` and the passed-object dummy in ``initRectangle`` is declared ``class(rectangle)``. Recall that a type-bound procedure's passed-object dummy must match the type of the derived type that defined it. Other than differing passed-object dummy arguments, the interface for the child's overriding type-bound procedure is identical with the interface for the parent's type-bound procedure. That is because both type-bound procedures are invoked in the same manner:

```fortran
type(shape) :: shp                                  ! declare an instance of shape
type(rectangle) :: rect                             ! declare an instance of rectangle
type(square) :: sq                                  ! declare an instance of square
call shp%initialize(1, .true., 10, 20)              ! calls initShape
call rect%initialize(2, .false., 100, 200, 11, 22)  ! calls initRectangle 
call sq%initialize(3, .false., 400, 500)            ! calls initRectangle
```
> Note that ``sq`` is declared ``square`` but its initialize type-bound procedure invokes ``initRectangle`` because ``sq`` inherits the ``rectangle`` version of ``initialize``.

Although a type may override a type-bound procedure, it is still possible to invoke the version defined by a parent type. Recall in section 2, "Objects in Fortran 90/95/2003", that each type extension contains an implicit parent object of the same name and type as the parent. We can use this implicit parent object to access components specific to a parent, say, a parent's version of a type-bound procedure:

```fortran
call rect%shape%initialize(2, .false., 100, 200)         ! calls initShape
call sq%rectangle%shape%initialize(3, .false., 400, 500) ! calls initShape
```
Aveces queremos que el objeto hijo no pueda sobreescribir procedimientos de los padres, para esto usamos la sentencia  **`` NON_OVERRIDABLE ``** en el binding-attribute y prevenimos que cualquier extension sobrescriba algun type-bound procedure particular:

```fortran
type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure, non_overridable :: initialize
end type shape
```

## Funcciones como Type-Bound Procedures
Hasta el momento aplicamos subroutines para implementar type-bound procedures. Podemos hacer lo mismo con funciones, por ejemplo:

```fortran
module shape_mod

type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    procedure :: isFilled
end type shape

contains

    logical function isFilled(this)
        class(shape) :: this
        isFilled = this%filled
    end function isFilled
     
end module
```
Para invocar la funcion la sintaxis a usar es:

```fortran
use shape_mod
type(shape) :: shp        ! declare an instance of shape
logical filled
call shp%initialize(1, .true., 10, 20)              
filled = shp%isFilled()
```

## Information Hiding
En los ejemplos anteriores, vimos como un objeto hijo puede sobreescribir un type-bound procedure de un ancestro. Esto permite a usuario de estos objetos a invocar procedimientos sin ningun conocimiento de los detalles de implementacion. Esto es un ejemplo de *information hiding*, otro aspecto importante de POO. Este permite al programador ver a un objeto y sus procedimientos como una "caja negra"

Inquiry functions, like the ``isFilled`` function in section 8, "Functions as Type-Bound Procedures", are common with information hiding. The motivation for inquiry functions, rather than direct access to the underlying data, is that the object's implementer can change the underlying data without affecting the programs that use the object. Otherwise, each program that uses the object would need to be updated whenever the underlying data of the object changes.

Para habilitar information hiding, F2003 provee de una sentencia **``PRIVATE``**. F2003 tambien contiene la sentencia **``PUBLIC``** para deshabilitarlo. Por default todos los derivedtype son declarados **``PUBLIC``**. Veamos un ejemplo de su uso:

```fortran
module shape_mod

private    ! hide the type-bound procedure implementation procedures
public :: shape, constructor   ! allow access to shape & constructor procedure

type shape
    private               ! hide the underlying details
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    private                         ! hide the type bound procedures by default
    procedure         :: initShape  ! private type-bound procedure
    procedure, public :: isFilled   ! allow access to isFilled type-bound procedure
    procedure, public :: print      ! allow access to print type-bound procedure
end type shape

contains

    logical function isFilled(this)
        class(shape) :: this
        isFilled = this%filled
    end function isFilled
 
    function constructor(color, filled, x, y)
        type(shape) :: constructor
        integer :: color
        logical :: filled
        integer :: x
        integer :: y
        call constructor%initShape(color, filled, x, y)
    end function constructor

    subroutine initShape(this, color, filled, x, y)
        ! initialize shape objects
        class(shape) :: this
        integer :: color
        logical :: filled
        integer :: x
        integer :: y

        this%color = color
        this%filled = filled
        this%x = x
        this%y = y
    end subroutine initShape

    subroutine print(this)
        class(shape) :: this
        print *, this%color, this%filled, this%x, this%y
    end subroutine  print

end module
```
El ejemploanterior usa information hiding en el modulo host y en el type shape. La sentencia ``private`` habilita el ocultamiento de informacion. El modulo es privado, al igual que los componentes del shape y proceso constructor es publico para poder ser utilizado.
Notar que el **private** que aparece luego de **contains** en el type ``shape`` solo afecta a los componentes de ``shape``. 

En el ejemplo  el procedimiento ``initShape`` fue declarado **private**. Por lo tantosolo procedimientos locales al modulo host pueden invocar el procedimiento.
Es decir para invocar ``initShape`` se debe acudir al procedimiento ``constructor``. Por ejemplo:

```fortran
program shape_prg
    use shape_mod
    type(shape) :: sh
    logical filled
    sh = constructor(5, .true., 100, 200)
    call sh%print()
end program shape_prg
```

## 10. Type Overloading
En el ejemplo anterior para acedder a un procedimiento ligado a ``shape`` invocamos una funcion llamada ``constructor``, esta funcion bien podria haber sido definida en alguna parte del programa, y por lo tanto habria un conflicto de nombres (*overloading*). 

F2003 permite al programador sobrecargar el nombre del derived type conuna interface generica. Esta interfaz actua como wrapper para nuestra funcion. La sintaxis seria:

```fortran
program shape_prg
    use shape_mod
    type(shape) :: sh
    logical filled
    sh = shape(5, .true., 100, 200)  ! invoke constructor through shape generic interface
    call sh%print()
end program shape_prg
```

```fortran
module shape_mod

private    ! hide the type-bound procedure implementation procedures
public :: shape ! allow access to shape

type shape
    private               ! hide the underlying details
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
contains
    private                         ! hide the type bound procedures by default
    procedure         :: initShape  ! private type-bound procedure
    procedure, public :: isFilled   ! allow access to isFilled type-bound procedure
end type shape

interface shape
    procedure constructor       ! add constructor to shape generic interface
end interface

contains
     :
     :
end module shape_mod
```
Nuestrafuncion esahora declarada private y es invocada via la interface generica publica ``shape``

## 11. Conclusion
Code reusability, an important feature of Object-Oriented Programming (OOP), is enabled through inheritance, polymorphism, and information hiding. With inheritance, an object can be extended and code from the parent object can be reused or overloaded in the child object. Code reusability is also enabled through polymorphism. There are two types of polymorphism: procedure polymorphism and data polymorphism. Procedure polymorphism enables code reusability because a procedure can operate on a variety of data types and values. The programmer does not have to reinvent the wheel for every data type a program may encounter with a polymorphic procedure. Part 2 of this article will cover data polymorphism. Finally, we examined information hiding which allows programmers to use an object without having to understand its underlying implementation details. Fortran 2003 (F2003) supports inheritance, polymorphism, and information hiding through type extension, the **CLASS** keyword, and the **PUBLIC/PRIVATE** keywords/binding-attributes respectively.


# Polimorfismo de datos

La sentencia ``**CLASS**`` permite crear variables polimorficas, estos son variables cuyo data type es dinamico durante la ejecuciondel programa. Debe ser un ``pointer``, ``allocatable`` o un dummy argument. Por ejemplo:

```fortran
subroutine init(sh)
  class(shape) :: sh              ! polymorphic dummy argument
  class(shape), pointer :: p      ! polymorphic pointer variable
  class(shape), allocatable:: als ! polymorphic allocatable variable
end subroutine init
```

La variable polimorfica ``p`` puede apuntar a cualquier objeto de type ``shape`` o a cualquiera de sus extensiones, por ejemplo:
```fortran 
subroutine init(sh)
  class(shape),target :: sh
  class(shape), pointer :: p
  
  select type (sh)
  type is (shape)
    p => sh
    :  ! shape specific code here
  type is (rectangle)
    p => sh
    :  ! rectangle specific code here
  type is (square)
    p => sh
    :  ! square specific code here
  class default
    p => null()
  end select
:
end subroutine init
``` 

El **select type** destaca el hecho de que ``p``, puede tomar como pointer varios typess. Ademas el type de ``p`` no esta determinado hasta que se realiza la asignacion (i.e., ``p => sh``).

Una variable polimorfica allocatable recibe su propio type y opcionalmente su propio valor al momento de su allocatacion.

```fortran
class(shape), allocatable :: als
allocate(als)
```
In the example above, we allocate polymorphic variable ``als``. By default, the dynamic type of a polymorphic allocatable variable is the same as its declared type after executing an allocate statement. In the example above, variable ``als`` receives dynamic type ``shape`` after we execute the allocate statement.

Obviously there is not much use for polymorphic allocatable variables if we can only specify the declared type in an **allocate** statement. Therefore, F2003 provides typed allocation to allow the programmer to specify a type other than the declared type in an **allocate** statement. Below is an example:

```fortran
class(shape), allocatable :: als
allocate(rectangle::als)
```

In the allocate statement above, we specify a type followed by a ``::`` and the variable name. In this case, we specify ``rectangle`` as the dynamic type of variable ``als``. 
> Note that the declared type of ``als`` is still ``shape``. Also the type specification must be the same or a type extension of the declared type of the allocatable variable. 

Below is another example that illustrates how we may allocate a polymorphic variable with the same type of another object:

```fortran
subroutine init(sh)
  class(shape) :: sh
  class(shape), allocatable :: als
  
  select type (sh)
  type is (shape)
    allocate(shape::als)
  type is (rectangle)
    allocate(rectangle::als)
  type is (square)
    allocate(square::als)
  end select
:
end subroutine init
```
Now, let's illustrate how we may expand our example above to create a "copy" of an object.

```fortran
subroutine init(sh)
  class(shape) :: sh
  class(shape), allocatable :: als
  
  select type (sh)
  type is (shape)
    allocate(shape::als)
    select type(a)
    type is (shape)
      als = sh   ! copy sh
    end select
  type is (rectangle)
    allocate(rectangle::als)
     select type (als)
     type is (rectangle)
       als = sh ! copy sh
     end select
  type is (square)
    allocate(square::als)
    select type (als)
    type is (square)
      als = sh   ! copy sh
    end select
  end select
:
end subroutine init
```
Recall that the programmer can only access the components of the declared type by default. Therefore, in the example above, we can only access the ``shape`` components for object ``als`` by default. In order to access the components of the dynamic type of object ``als``, a nested select type is used for object ``als``.

The previous example presents an interesting application of data polymorphism; making a copy or a clone of an object. Unfortunately, the previous example does not scale well if shape has several type extensions. Also whenever we add a type extension to shape, we need to ``update`` our ``init()`` subroutine to include the new type extension. To address this problem, F2003 provides sourced allocation, as illustrated below:

```fortran
subroutine init(sh)
  class(shape) :: sh
  class(shape), allocatable :: als
  allocate(als, source=sh) ! als becomes a clone of sh
  :
end subroutine 
```
The optional ``source=`` argument to allocate specifies sourced allocation. In our example above, the **allocate** statement will allocate ``als`` with the same dynamic type as ``sh`` and with the same value(s) of ``sh``. 
> Note that the declared type of the ``source=`` must be the same or a type extension of the allocate argument (e.g., ``als``).

## 3. Unlimited Polymorphic Objects
Our discussion on data polymorphism so far has been limited to derived types and their type extensions. While this satisfies most applications, sometimes we may want to write a procedure or a data structure that can operate on any type including any intrinsic or derived type. F2003 provides unlimited polymorphic objects for just that purpose. Below are some examples of unlimited polymorphic objects:

```fortran
subroutine init(sh)
  class(*) :: sh              ! unlimited polymorphic dummy argument
  class(*), pointer :: p      ! unlimited polymorphic pointer variable
  class(*), allocatable:: als ! unlimited polymorphic allocatable variable
end subroutine init
```

The ``class(*)`` keyword is used to specify an unlimited polymorphic object declaration. The operations for unlimited polymorphic objects are similar to those mentioned for "limited" polymorphic objects in the previous section. However, unlike "limited" polymorphic objects, their "unlimited" counterparts can take any F2003 type. Below is an example of unlimited polymorphic objects used with procedure polymorphism:

```fortran
subroutine init(sh)
  class(*) :: sh
  
  select type(sh)
  class is (shape)
    :   ! shape specific code
  type is (integer)
    : ! integer specific code
  type is (real)
    : ! real specific code
  type is (complex)
    : ! complex specific code
  end select
end subroutine init
```
Similarly, any pointer or target can be assigned to an unlimited polymorphic pointer, regardless of type. For example,

```fortran
subroutine init(sh)
  class(*),target :: sh
  class(*), pointer :: p
  
  p => sh  
  
  select type(p)
  class is (shape)
    :   ! shape specific code
  type is (integer)
    : ! integer specific code
  type is (real)
    : ! real specific code
  type is (complex)
    : ! complex specific code
  end select
  
end subroutine init
```
The example above shows ``sh`` assigned to pointer ``p`` and then a **select type** construct is used to query the dynamic type of pointer ``p``.

Unlimited polymorphic objects can also be used with typed allocation. In fact, a type (or ``source=`` argument) must be specified with the **allocate** statement since there is no default type for ``class(*)``. However, unlike their "limited" counterparts, any F2003 type, intrinsic or derived, can be specified. For example,

```fortran
subroutine init(sh)
  class(*) :: sh
  class(*), allocatable :: als
  
  select type(sh)
  type is (shape)
    allocate(shape::als)
  type is (integer)
    allocate(integer::als)
  type is (real)
    allocate(real::als)
  type is (complex)
    allocate(complex::als)
  end select
:
end subroutine init
```
Sourced allocation can also operate on unlimited polymorphic objects:

```fortran
subroutine init(sh)
  class(*) :: sh
  class(*), allocatable :: als
  allocate(als, source=sh) ! als becomes a clone of sh
  :
end subroutine  init
```
Note if the ``source=`` argument is an unlimited polymorphic object (i.e., declared ``class(*)``), the allocate argument (e.g., ``als``) must also be an unlimited polymorphic object. When the allocate argument is declared ``class(*)``, the declared type in the ``source=`` argument can be any type including ``class(*)``, any derived type, or any intrinsic type. For example,

```fortran
class(*), allocatable :: als
integer i
i = 1234
source(als, source=i)
```

The above code demonstrates sourced allocation with an unlimited polymorphic allocatable argument and an intrinsic typed ``source=`` argument.

## 4. Case Study: Data Polymorphic Linked List
As mentioned in the previous section, one of the advantages to unlimited polymorphic objects is that we can create data structures that can operate on all data types (intrinsic and derived) in F2003. To demonstrate, we will create data structures that can be used to create a heterogeneous list of objects. Traditionally, data stored in a linked list all have the same data type. However, with unlimited polymorphic objects, we can easily create a list that contains a variety of data types and values.

We start out by creating a derived type that will represent each link in our linked list. For example,

```fortran
type link
   class(*), pointer :: value => null()
   type(link), pointer :: next => null()
end type link
```
The basic link derived type above contains an unlimited polymorphic pointer that points to the value of the link followed by a pointer to the next link in the list. Recall that information hiding allows others to use an object without understanding its implementation details. Therefore, we will place this derived type into its own module, add a constructor, and add some type-bound procedures to access the value(s). For example,

```fortran
module link_mod
  private    ! information hiding  
  public :: link
  
  type link
     private   ! information hiding
     class(*), pointer :: value => null()
     type(link), pointer :: next => null()
     contains
     procedure :: getValue    ! get value in this link
     procedure :: nextLink    ! get the link after this link
     procedure :: setNextLink ! set the link after this link
  end type link

  interface link
    procedure constructor
  end interface

contains
   
  function nextLink(this)
    class(link) :: this
    class(link), pointer :: nextLink
    nextLink => this%next
  end function nextLink
   
  subroutine setNextLink(this,next)
    class(link) :: this
    class(link), pointer :: next
    this%next => next
  end subroutine setNextLink
  
  function getValue(this)
    class(link) :: this
    class(*), pointer :: getValue
    getValue => this%value
  end function getValue
  
  function constructor(value, next)
    class(link),pointer :: constructor
    class(*) :: value
    class(link), pointer :: next
    allocate(constructor)
    constructor%next => next
    allocate(constructor%value, source=value)
  end function constructor
  
end module link_mod
```

Because we added the private keywords above, the user of the object must use the ``getValue()`` function to access the values of each link in our list, the ``nextLink()`` procedure to access the next link in the list, and ``setNextLink()`` to add a link after a link. Note that the ``getValue()`` function returns a pointer to a ``class(*)``, meaning it can return an object of any type.

We employ type overloading for the constructor function. Recall from part one that type overloading allows us to create a generic interface with the same name as a derived type. This allows us to create a constructor function and hide it behind the name of the type. Using our example above, we can construct a link in the following manner:

```fortran
class(link),pointer :: linkList
integer v
linkList => link(v, linkList%next)
```

Although one could easily create a linked list with just the link object above, the real power of OOP lies in its ability to create flexible and reusable components. Unfortunately, the user is still required to understand how the list is constructed with the link object (e.g., the link constructor assigns its result to the ``linkList`` pointer above). Therefore, we can create another object called list that acts as the "Application Program Interface" or API to the link object. Below is an example of a list object that acts as an API to our linked list data structure:.

```fortran
type list
  class(link),pointer :: firstLink => null() ! first link in list
  class(link),pointer :: lastLink => null()  ! last link in list
contains
  procedure :: addInteger ! add integer to list
  procedure :: addChar    ! add character to list
  procedure :: addReal    ! add real to list
  procedure :: addValue   ! add class(*) to list
  generic :: add => addInteger, addChar, addReal
end type list
 ```
The list derived type has two data components, ``firstlink``, which points to the first link in its list and ``lastLink`` which points to the last link in the list. The ``lastLink`` pointer allows us to easily add values to the end of the list. Next, we have three type-bound procedures called ``addInteger()``, ``addChar()``, and ``addReal()``. As one may guess, the first three procedures are used to add an ``integer``, a ``character``, and a ``real`` to the linked list respectively. The ``addValue()`` procedure adds ``class(*)`` values to the list and is the main add routine. The ``addInteger()``, ``addChar()``, and ``addReal()`` procedures are actually just wrappers to the ``addValue()`` procedure. Below is the ``addInteger()`` procedure. The only difference between ``addInteger()``, ``addChar()``, and ``addReal()`` is the data type dummy argument, value.

```fortran
subroutine addInteger(this, value)
  class(list) :: this
  integer value
  class(*), allocatable :: v
  
  allocate(v,source=value)
  call this%addValue(v)
end subroutine addInteger
```
The ``addInteger()`` procedure takes an ``integer`` value and allocates a ``class(*)`` with that value using sourced allocation. The value is then passed to the ``addValue()`` procedure shown below:

```fortran
subroutine addValue(this, value)
  class(list) :: this
  class(*), value
  class(link), pointer :: newLink
  
  if (.not. associated(this%firstLink)) then
     this%firstLink => link(value, this%firstLink)
     this%lastLink => this%firstLink
  else
     newLink => link(value, this%lastLink%nextLink())
     call this%lastLink%setNextLink(newLink)
     this%lastLink => newLink
  end if
  
end subroutine addValue   
```
The ``addValue()`` procedure takes two arguments; a ``list`` and a ``class(*)``. If the ``list``'s``firstLink`` is not associated (i.e., points to ``null()``), then we will add our value to the start of the list by assigning it to the ``list``'s``firstLink`` pointer. Otherwise, we add it after the ``list``'s``lastLink`` pointer.

Returning to the list type definition above, you will see the following statement:

```fortran
generic :: add => addInteger, addChar, addReal
```

This statement uses an F2003 feature known as a generic-type bound procedure. Generic-type bound procedures act very much like generic interfaces, except they are specified in the derived-type and only type-bound procedures are permitted in the generic-set.

In our example above, we can invoke the add type-bound procedure and either the ``addInteger()``, ``addChar()``, or ``addReal()`` implementations will get called. The compiler will determine which procedure to invoke based on the data type of the actual arguments. If we pass an integer to ``add()``'s value argument, ``addInteger()`` will get invoked, a character value will invoke ``addChar()``, and a real value will invoke ``addReal()``.

Below is a simple program that adds values to a list and prints out the values. You can download the complete [list_mod](https://gist.github.com/n-s-k/de4af7ce6cc8f2c85e4b33cedb51fd88#file-list-f90) and [link_mod](https://gist.github.com/n-s-k/de4af7ce6cc8f2c85e4b33cedb51fd88#file-link-f90) modules, which encapsulate the list and link objects respectively.

```fortran 
program main
  use list_mod
  implicit none
  integer i
  type(list) :: my_list

  do i=1, 10
     call my_list%add(i)
  enddo
  
  call my_list%add(1.23)
  call my_list%add('A')
  call my_list%add('B')
  call my_list%add('C')
  call my_list%printvalues()
end program main
```
```console
% pgfortran -c list.f90
% pgfortran -c link.f90
% pgfortran -V main.f90 list.o link.o
pgfortran 15.1-0 64-bit target on x86-64 Linux -tp sandybridge
The Portland Group - PGI Compilers and Tools
Copyright 2015, NVIDIA CORPORATION.  All Rights Reserved.
% a.out
            1
            2
            3
            4
            5
            6
            7
            8
            9
           10
    1.230000
 A
 B
 C
 ```
## 5. Abstract Types and Deferred Bindings
In our case study, we had a ``list`` derived type that acted as the API for our linked list. Rather than employ one implementation for the ``list`` derived type, we could choose to define some of the components and type-bound procedures for a ``list`` object and require the user to define the rest. This can be accomplished through an **abstract** type. An **abstract** type is a derived type that cannot be instantiated. Instead, it is extended and further defined by another type. The type extension too can be declared abstract, but ultimately it must be extended by a non-abstract type if it ever is to be instantiated in a program. Below is an example of list type declared abstract:

```fortran
module abstract_list_mod
:
type, abstract :: list
   private
   class(link),pointer :: firstLink => null() ! first link in list
   class(link),pointer :: lastLink => null()  ! last link in list
   class(link),pointer :: currLink => null()  ! list iterator
 contains
   procedure, non_overridable :: addValue    ! add value to list
   procedure, non_overridable :: firstValue  ! get first value in list
   procedure, non_overridable :: reset       ! reset list iterator
   procedure, non_overridable :: next        !iterate to next value in list
   procedure, non_overridable :: currentValue! get current value in list 
   procedure, non_overridable :: moreValues  ! more values to iterate?
   generic :: add => addValue
   procedure(printValues), deferred :: printList  ! print contents of list
end type list

abstract interface
  subroutine printValues(this)
    import list
    class(list) :: this
  end subroutine
end interface
:
end module abstract_list_mod
 ```
 
The abstract list type above uses the link type discussed in the previous section as its underlying data structure. We have three data components, firstLink, lastLink, and currLink. The firstLink and lastLink components point to the first and last link in the list respectively. The currLink component points to the "current" link that we are processing in the list. In other words, currLink acts as a list iterator that allows us to traverse the list using inquiry functions. If we did not provide a list iterator, the user of our list type would need to understand the underlying link data structure. Instead, we take advantage of information hiding by providing a list iterator.

Our list type is declared abstract. Therefore, the following declaration and allocate statements are invalid for list:

```fortran
type(list) :: my_list    ! invalid because list is abstract
allocate(list::x)        ! invalid because list is abstract
```

On the other hand, the abstract type can be used in a class declaration since its dynamic type can be a non-abstract type extension. For example,

```fortran
subroutine list_stuff(my_list)
  class(list) :: my_list 
  class(list), pointer :: p
  class(list), allocatable :: a 
  
  select type (my_list)
  class is (list)
  :
  end select
end subroutine
```
The above usage of list is valid because we are not declaring or allocating anything with type list. Instead, we are asserting that each variable is some type extension of list.

In our list type definition above, we added the **deferred** binding to the ``printValues`` type-bound procedure. The **deferred** binding can be added to type-bound procedures that are not defined in the abstract type but must be defined in all of its non-abstract type extensions. Deferred bindings allow the author of the abstract type to dictate what procedures must be implemented by the user of the abstract type and what may or may not be overridden. F2003 also requires that a deferred binding have an interface (or an abstract interface) associated with it. The following is the syntax for deferred bindings:

```fortran
procedure (interface-name), deferred :: procedure-name
```

Because deferred bindings have an interface associated with them, there is no ``=>`` followed by an implementation-name allowed in the syntax (e.g., ``procedure, deferred :: foo => bar`` is not allowed).

Below is an example of a type that extends our list type above:

```fortran
module integer_list_mod
:
type, extends(list) :: integerList
contains
   procedure :: addInteger     
   procedure :: printList => printIntegerList
   generic :: add => addInteger
end type integerList
:
end module integer_list_mod
```
The ``integerList`` extends our abstract type, list. Note that ``printList()`` is defined as required by the deferred binding in list. Below is the implementation for the ``printList()`` type-bound procedure:
```fortran
subroutine printIntegerList(this)
  class(integerList) :: this
  class(*), pointer :: curr
  
  call this%reset()              ! reset list iterator
  
  do while(this%moreValues())    ! loop while there are values to print
    curr => this%currentValue() ! get current value
    select type(curr)
    type is (integer)
      print *, curr            ! print the integer
    end select
    call this%nextValue()       ! increment the list iterator
  end do
  
  call this%reset()              ! reset list iterator
  
end subroutine printIntegerList
```
In ``printIntegerList()``, we print out the integers in our list. We first call the list ``reset()`` procedure to make sure that the list iterator is at the beginning of the list. Next, we loop through the list, calling the list's ``moreValues()`` function to determine if our list iterator has reached the end of the list. We call the list's ``currentValue()`` function to get the value that the list iterator is pointing to. We then use a **select type** to access the integer value and print it. Finally, we call the list's ``nextValue()`` procedure to increment the list iterator so we can access the next value.

Below is a sample program that uses our abstract list and integerList types. The sample program adds the integers one through ten to our list and then calls the ``integerList``'s ``printList()`` procedure. Next, the program traverses the list, places the integers into an array, and then prints out the array. You can download the complete [abstract_list_mod](https://gist.github.com/n-s-k/de4af7ce6cc8f2c85e4b33cedb51fd88#file-abstract_list-f90) and [integer_list_mod](https://gist.github.com/n-s-k/de4af7ce6cc8f2c85e4b33cedb51fd88#file-integer_list-f90) modules from the PGI website.

```fortran
program main
  use integer_list_mod
  implicit none
  integer i
  type(integerList) :: my_list
  integer values(10)
  
  do i=1, 10
     call my_list%add(i)
  enddo
  
  call my_list%printList()
  print *
  
  call my_list%reset()
  i = 1
  do while(my_list%moreValues())
     values(i) = my_list%current()
     call my_list%next()
     i = i + 1
  end do
  
  print *, values
end program main
```

Below is a sample compile and run of the above program:

```console
% pgfortran -c link.f90
% pgfortran -c abstract_list.f90
% pgfortran -c integerList.f90
% pgfortran -V main.f90 link.o abstract_list.o integerList.o

pgfortran 11.6-0 64-bit target on x86-64 Linux -tp penryn
Copyright 1989-2000, The Portland Group, Inc.  All Rights Reserved.
Copyright 2000-2011, STMicroelectronics, Inc.  All Rights Reserved.
% a.out
            1
            2
            3
            4
            5
            6
            7
            8
            9
           10

            1            2            3            4            5
6           7            8            9           10
```

## 6. Conclusion
Polymorphism permits code reusability in the Object-Oriented Programming paradigm because the programmer can write procedures and data structures that can operate on a variety of data types and values. The programmer does not have to reinvent the wheel for every data type a procedure or a data structure will encounter. 

There are two types of polymorphism: procedure polymorphism and data polymorphism. Procedure polymorphism occurs when a procedure can operate on a variety of data types and values. Data polymorphism occurs when we have a pointer or allocatable variable that can operate on a variety of data types and values. 

The dynamic type of these variables change when we assign a target to a polymorphic pointer variable or when we use typed or sourced allocation with a polymorphic allocatable variable. Next, we looked at unlimited polymorphic objects and presented a case study where these objects can be used to create heterogeneous data structures (e.g., a list object that links together a variety of data types). Finally, we looked at how abstract types can be used to dictate requirements for type extensions and how they interact with polymorphic variables.


