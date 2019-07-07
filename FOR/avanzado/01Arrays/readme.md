# Arrays

>  Operaciones avanzadas con arrays.

### Operaciones entre arrays comformables
Dos arrays son comformables si tienen el mismo `shape`. FORTRAN permite realizar operaciones entre arrays comformables. Por ejemplo, sean `a`, `b`, y `c` comformables, esta permitido: `c=a*5.0+b*0.1`, y el resultado se obtiene aplicando la operacion elemento a elemento.

Notar que los escalares (`5.0` y `0.1`) son considerados comformables con cualquier array.

Esto aplica tambien a arrays que aunque sean comformes esten indexados distinto, por ejemplo:

```fortran
	real, dimension(100,200)      :: A
	real, dimension(0:99,0:199)   :: B
	real, dimension(-1:98,-1:198) :: C

	C = A * 2.0  + B * 1.3
```
El resultado tambien es elemento por elemento, pero no basado en el indice, sino en la estructura/forma del array.

### Funciones intrinsecas:

Las funciones intrinsecas en fortran son *elementales*, esto quiere decir que los argumentos pueden tener cualquier forma, y cando se aplican a una variable esta funcion se aplican elemento por elemento.


### Reduccion
Las reducciones o *funciones transformacionales*, aceptan un array como argumento y retornan un escalar o almenos un array de menor rango. 

- `all(mask,*dim*)`
- `any(mask,*dim*)`
- `count(mask,*dim*)`
- `maxval(array,*dim,mask*)`
- `minval(array,*dim,mask*)`
- `sum(array,*dim,mask*)`
- `product(array,*dim,mask*)`
- `sumarray,*dim,mask*()`
- `size(array,*dim*)`

donde **`mask`** es un array de misma forma al original, pero formado por *`.true.`*/*`.false.`*





## Manipulacion de arrays:
- `cshift(array, shift, *dim*)`
- `eoshift(array, shift, *boundary,dim*)`
- `merge(array1, array2, mask) `
- `pack(array, mask, *vector*)`
- `reshape(array, shape, *pad,order*) `
- `spread(array, dim, ncopies) `
- `transpose(array)`
- `unpack(array, shift, *dim*)`


## Operaciones vectoriales
- `dot_product(vecA,vecB)`
- `matmul(matrizA, matrizB)`

El producto externo (*outer product*) no existe como funcion base en FORTRAN, pero puede ser programado.



- ` where(*condition*) `
```fortran
where (array>0)
	array = 2*array+10.0
end where 
```


- ` forall(*condition*) `
```fortran
forall (i=1:20, j=1:10:2)
	x(i,j)=y(j,i)
	z(i,j)=y(j,i)**2
end forall

```
