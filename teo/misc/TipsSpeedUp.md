# Consejos para mejorar performance:

> Revisemos formas de mejorar la performance de un programa.

## Mejora escalar:

### Optimizacion

### A nivel de compilación:
```bash
gfortran -On programa.f90
```
donde n puede ser:
 - ``-O0``  sin optimizacion. 
 - ``-O1``, ``-O2`` optimizaciones menores, no afectan precision en los resultados.
 - ``-O3`` máximo nivel de optimizacion, puede demorar el tiempo de compilación y afectar la precision de los resultados.

### A nivel de sentencias:
	- **Simplificacion de constantes **, evitar variables del tipo ``y=4+8`` (reemplazar por ``y=12``).
	- **Evitar condicionales** , en lugar de expresiones del tipo ``IF (i .eq.j .or. i .eq. k)`` usar directamente ``i=j``.
	- **Usar registros**, para variables muy usadas, guardarlos en registros.
### A nivel de bloques:
	- Eliminar bloques que no se ejecutan.
	- Ordenar instrucciones para mejorar el acceso de memoria.

### A nivel de bloques:

### A nivel de bloques:


## Mejora paralela:




## Timming




## Caché


