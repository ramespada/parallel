         program testmpi

          include 'mpif.h'

           integer :: numtask,rank,len,ierr
           character(50) :: hostname
           
           call MPI_INIT(ierr)

           call MPI_COMM_SIZE(MPI_COMM_WORLD,numtask,ierr)

           call MPI_GET_PROCESSOR_NAME(hostname, len ,ierr)

       print*, 'Number of tasks: ',numtask
       print*, 'My tank',rank
       print*, 'Running on',hostname


           call MPI_FINALIZE(ierr)

           end program
