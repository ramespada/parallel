      program hola
      
          include 'mpif.h'

          call MPI_INIT()


              print*,"Hola mundo!"

          call MPI_FINALIZE()

      end program
