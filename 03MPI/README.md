# Message Passing Interface (MPI)

> MPI es una especificación para desarrolladores y usuarios de librerias de pasaje de mensajes. Su objetivo es ser una interfaz práctica, portable, eficiente y flexible. Una gran ventaja de MPI es que está adaptada para cualquier arquitectura de memoria (distribuida, compartida e híbrida).

Tiene soporte para Fortran, C/C++. Y la sintaxis es casi idéntica.

### Ejemplo simple:
Un programa  *hola mundo* paralelizado con MPI en fortran sería:
 

```fortran
    program hola
        include 'mpif.h'

        call MPI_INIT()

            print*, "Hola mundo!"

        call MPI_FINALIZE()

    end program
```
Compilar:  ``` mpif90  hola_mundo.f ```

Correr (4 cores): ``` mpirun -n 4 a.out ```



### Rutinas de manejo de ambiente:

#### ` MPI_INIT() `
Inicia ambiente de ejecución.

#### ` MPI_COMM_SIZE(*comm,size,ierr*) `
Retrona el numero de procesos especificados en el comunicador

#### ` MPI_COMM_SIZE(*comm,size,ierr*) `
Retron el rango  de proceso llamado por MPI en el comunicador *comm*.

#### ` MPI_ABORT(*comm,errorcode,ierr*) ` 
Finaliza el proceso asociado al comunicador.

#### ` MPI_GET_PROCESOR_NAME(**) `

#### ` MPI_GET_VERSION(**) `

#### ` MPI_INITIALIZED(*flag, ierr*) `

#### ` MPI_WTIME() `

#### ` MPI_WTICK() `

#### ` MPI_FINALIZED() `




#### Comunicación punto a punto
Comunicación entre dos y solo dos .



#### Buffering

#### Blocking

#### Orden & Fairness



### Comunicación colectiva



### Data types:




### Topologías virtuales




