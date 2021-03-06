# V I M

>

---

## ENTRAR/SALIR DE VIM
Entrar a VIM: 
```bash
vim archivo.txt 
```

Salir de VIM: 
```vim
:q! 
```

## MODOS:
VIM posee dos modos principales:
- Modo normal: (*default*), se ingresa apretando \<ESC\>.
- Modo edición/escritura: Se ingresa aprendando alguno de las siguientes teclas: i/I/a/A/r/R/o/O

## MOVER EL CURSOR: 

	     ^    
	     k    
	< h -|- l >	
	     j    
	     v     

## INSERCIÓN:
Modo INSERTAR:
- ``i`` Ingresa a modo EDICION desde la posicion del cursor. (insert)
- ``I`` Ingresa a modo EDICION desde el principio de linea.
Modo AGREGAR:
- ``a`` Ingresa a modo EDICION desde la posicion siguiente al cursor. (append)
- ``A`` Ingresa a modo EDICION desde el final de la linea.

Modo ABRIR LINEA:
- ``o`` Ingresa a modo EDICION desde inicio de fila anterior.
- ``O`` Ingresa a modo EDICION desde inicio de fila posterior.		

## DELECIÓN:
En *modo edición*, se borra como normalmente con las teclas: *<supr>* y *<del>*.

En *modo normal*:
- ``x`` Borra caracter actual.
- ``X`` Borra caracter anterior.
- ``d <dirección>`` Borra caracter.
- ``D`` Borra hasta el final de la linea. Igual que d$
- ``dd`` Borra linea.
- ``dw`` Borra hasta final de palabra.

## UNDO:
- ``u`` UNDO
- ``ctrl`` ``r`` REDO
- ``U`` UNDO en toda la linea

## GUARDAR:

- Guardar y salir    **:wq **
- Guardar sin salir  **:w  **	
- Guardar en archivo **:w archivo **
- Guardar pedazo     **:li,lf w archivo ** donde li=linea inicial lf=linea final 

## NAVEGACION:
- ``gg`` Ir a primer linea.
- ``G``	 Ir a ultima linea.
- ``nG`` Ir a la linea n
- ``n%`` Ir al la linea n-porciento 

## FORMATO DE COMANDOS:
En modo normal el formato de comandos es:
 [numero] *comando* *objeto*

### NUMEROS:
Presionando un numero (n) antes de un comando indicamos que tal comando sea repetido n veces.

### OBJETOS:
- *w* hasta final de palabra (incluye espacio final).
- *e* hasta final de palabra (no incluye espacio final).
- *$* hasta final de linea.
- *0* hasta principio de linea
- *^* hasta siguiente caracter no vacio

Hay expeciones, por ejemplo: ``dd``
		
## COPY/PASTE:
- ``y``	copiar (*yank*)
- ``Y``	copiar linea
- ``p``	pegar a continuación
- ``P``	pegar antes de cursor

(en realidad dd es una forma de CORTAR)
## REMPLAZAR:
- **:r** remplazar caracter.
- **:R** entrar en modo REMPLAZO.

## CAMBIAR:
- **cw**	cambiar caracteres hasta el final de palabra (los borra y entra a insert/mode)
- **c[N]w**	cambiar N palabras siguientes.
- **C**	cambiar hasta final de la linea (igual que c$)

## LOCALIZACION Y ESTADO
- **ctrl+g** 	muestra posicion relativa del cursor en el archivo.

## BUSQUEDA

- **/patron**	busca el patron en el archivo (hacia adelante)
- **?patron**	busca el patron en el archivo (hacia atras)
- **n** va al siguiente acierto		
- **N**	va al anterior  acierto

## MATCHEO de PARENTESIS
- **%**	te lleva donde esta el par que corresponde con el ``()``,``[]``,``{}``		
## BUSCAR Y REEMPLAZAR:

- **:s/old/new** subsituye 'new' por 'old' en la primer aparicion en linea actual
- **:s/old/new/g** subsituye 'new' por 'old' en la linea actual
- **:%s/old/new/g**	subsituye 'new' por 'old' en todo el documento
- **:%s/old/new/gc** subsituye 'new' por 'old' en todo el documento (pide confirmacion en cada reemplazo)

## COMANDOS EXTERNOS

- **:!\<comando\>** ejecuta un comando externo

Algunos ejemplos:
- **:!pwd**
- **:!ls**
- **:!rm archivo**

## CONCATENAR ARCHIVOS
- **:r archivo**

## HELP
- **help **
