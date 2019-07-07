       PROGRAM datatypes
        implicit none
        
        logical  :: p, q=.TRUE.
        
        !Inicialización
        p=.FALSE.
        
        print*,'p: ',p
        print*,'q: ',q
        
        !Operaciones LOGICAS:
        print*,  .NOT. p
        print*,  p .AND.  q
        print*,  p .OR.   q
        print*,  p .EQV.  q
        print*,  p .NEQV. q  !XOR

       END PROGRAM datatypes
