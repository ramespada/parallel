        PROGRAM datatypes
                implicit none
                complex :: z1=(0,1),z2=(3,2)
        
       !Operaciones con COMPLEX
                print*, z1
                print*, z2
       !Aritmética: 	+ - * / **
                print*, z1+z2
                print*, z1-z2
                print*, z1*z2
                print*, z1/z2
                print*, z1**2
       
        !Funciones intrinsecas
                print*, real(z1)
                print*, aimag(z1)
                print*, conjg(z1)
                print*, abs(z2)
                print*, atan2(real(z2),aimag(z2))
        
        END PROGRAM datatypes
