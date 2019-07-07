        PROGRAM datatypes
                implicit none
        
                real 		:: x=1.2e-1, y=2.78
                real, parameter :: pi=3.14159265365897
        
        !Operaciones con REAL
        !Aritméticas: 	+ - * / **
                print*, 3+x*y
                print*, (3+x)*y
                print*, y**2*3
                print*, y**(2*3)
        !Funciones intrinsecas
                print*, sqrt(x),exp(x),log(x),log10(x);
                print*, sin(x),cos(x),tan(x);
                print*, asin(x),acos(x),atan(x);
                
                print*, real(7), int(7.000);
                print*, mod(x,y), abs(x);
                print*, min(x,y), max(x,y);
              
        END PROGRAM datatypes
