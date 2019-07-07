# 02 - *Data types*

> Presentar los tipos de variables que existen en FORTRAN.

Cualquier variable que se defina en fortran va a pertenecer a uno de estos 5 tipos:

  1. LOGICAL
  2. INTEGER
  3. REAL
  4. COMPLEX
  5. CHARACTER

Cada uno de ellos tiene sus propias características y operaciones.

## `LOGICAL`
También conocidos como *booleanos*, sólo pueden tomar dos valores: **.true.**  ó **.false.**. Para declararlas escribimos: `logical :: mi_variable_logica` .

### Operaciones lógicas
Estas operaciones toman 1 ó 2 variables lógicas y retornan otra variable lógica. Por ejemplo, sean `p` y `q` dos variables logicas:

| Sintaxis     | Operación         | Descripcion                                      |
| :----------: |:----------------- |:-------------------------------------------------|
| `  .not. p`  | *Negación*        |Retorna el opuesto.                           	 |
| `p .and. q`  | *Conjunción*      |Retorna **.true.**  sii ambas son **.true.**. 	 |
| `p .or. q`   | *Disyunción*      |Retorna **.false.** sii ambas son **.false.**.	 |
| `p .eqv. q`  | *Equivalencia*    |Retorna **.true.**  sii ambas son iguales.    	 |
| `p .neqv. q` | *In-equivalencia* *(XOR)* |Retorna **.false.** sii ambas son iguales.|


## `INTEGER`
Representan los números enteros. Se declaran: ` integer ::  mi_entero, otro_entero=2`
### Operaciones:
- **Aritméticas:**
    - Suma (+) y Resta (-)
    - Multiplicación (\*) y División (/)
    - Potencia (\*\*)

*(Advertencia: Los enteros no son cerrados en la division! Por lo tanto esta division retorna el cociente entero.)*

- **Relacionales:**
Toman dos *INTEGER* y devuelven un *LOGICAL*, sirven para comparar INTEGER entre sí, por ejemplo sean `n` y `m` dos enteros:

| Sintaxis    | Operación       | Descripcion                                        |
| ----------- |:---------------:|:-------------------------------------------------- |
| `n ==  m`   | *Igualdad*      | Devuelve  **.true.**  sii n es igual a m.          |
| `n /=  m`   | *DesIgualdad*   | Devuelve  **.false.** sii n es igual a m.       |
| `n  <  m`   | *Menor*         | Devuelve  **.true.**  sii n es menor a m.          |
| `n <=  m`   | *Menor-igualdad*| Devuelve  **.true.**  sii n es menor o igual a m. |
| `n  >  m`   | *Mayor*         | Devuelve  **.true.**  sii n es mayor a m.         |
| `n >=  m`   | *Mayor-igual*   | Devuelve  **.true.**  sii n es mayor o igual a m. |

 *(Advertencia: No confundir `==` con la asignación `=`)*

- **Intrinsecas:**
Las operaciones *intrinsecas* son funciones que vienen definidas en fortran. Las más importantes para `INTEGER` son:
```fortran
    abs(n)    ! valor absoluto de n
    mod(n,m)  ! resto de dividir n por m
```

## `REAL`
Los REAL (también conocidos como *punto flotante*) son los tpos de datos que usamos para representar numeros reales. 

*Advertencia: Los numeros reales tienen infinitos decimales pero las computadoras solo pueden almacenar en memoria números de finitios decimales, por lo que en algún punto tiene que redondearlos. Este proceso acarrea errores (conocidos como errores de redondeos).*
 
Para declarar un real escribimos:  `real  :: mi_numero_real`. Si queremos que tenga mas decimales podemos declararlo como `double precision  :: mi_var_doble_precisionx`.

### Operaciones:
- **Artiméticas**  (+, - , \* , /, \*\* )
    - Tener en cuenta la **precedencia** (jerarquias): la suma y la resta tienen mayor jerarquía que la multiplicación y la división, y estos a su vez mayor jeraquía que la potencia. Ante la duda lo mejor es utilizar todos los **parentesis** que sean necesarios.
  
- **Intrinsecas**
Hay muchas funciones en fortran definidas para reales, algunas de las más utilizadas son:
```fortran 
sqrt(x); log(x); log10(x); exp(x); sin(x); cos(x) ...
```
	*(Observación: utilizando `;` podemos ejecutar multiples instrucciones en una sóla linea.)*

## `COMPLEX`
Estos representan los números complejos (números con parte *real* y parte *imaginaria*). Se almacenan como un par ordenado  *(Re, Im)*, y se declaran:
` complex :: z=(1,2) `

### Operaciones

- **Aritmeticas**  (+ - \* / \*\*)

- **Intrinsecas**
Algunas funciones intrínsecas básicas de complejos son:
 ```fortran
      real(z)           !devuelve parte real
      aimag(z)          !devuelve parte imaginaria
      conjg(z)          !devuelve el conjugado de z
      abs(z)            !devuelve el módulo de z
      atan2(real(z), aimag(z)) !devuelve el argumento de z
```

## `CHARACTER`
Tambien conocidos como `strings`, se utilizan para almacenar letras y palabras. Se declaran: `character :: letra` ó `character(len=10) :: palabra`. Donde `len=n` define el numero de caracteres que tiene la variable.

### Operaciones:
```fortran
len(palabra)                	!devuelve el numero de caractéres
palabra(3:7) 		    	!substring (de la letra 3 a la 7)
palabra(3:)//palabra(1:3)   	!concatenación
trim(palabra)		    	!remueve espacios blancos al final del string
repeat(palabra,n)           	!concatena (repite) el string n-veces
index(palabra, patron)      !devuelve la posición en la que aparece 'x' por primera vez
scan(palabra,set)   !devuelve la pos. en la que aparece alguna de las letras 'set' por primera vez.
verify(palabra,set) !devuelve la pos. en donde 'palabra' deja de ser igual a 'set'
```

Operaciones tales como `upper`, `lower`, `replace` o `split` no estan presentes en fortran como operaciones base, pero obviamente pueden ser programadas sin mucha dificultad.

