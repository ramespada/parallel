# Miscelaneos:


## Interaccion con sistema operativo:

Desde FORTRAN podemos ejecutar comandos de consola:

```fortran
	
	call system('ls -l')

	call EXECUTE_COMMAND_LINE('ls -l')
```

	GET_COMMAND_ARGUMENT
	GET_ENVIRONMENT_VARIABLE

## C/C++
Tambien se puede interactuar con otros lenguajes, como por ejemplo C/C++




## Librerias y Makefiles


Cuando los programas se vuelven muy complejos, compilarlos puede ser un poco tedioso, para esto utilizamos Makefiles, que son scripts donde podemos especificar el orden de compilacion y las dependencias de forma sencilla.



Recordar que cuando utilizamos librerias externas hay que especificar donde se encuentran instaladas:

``` 
	-L/path/a/libreria -l<nombredelib>
	-I/path/a/includess 

```





