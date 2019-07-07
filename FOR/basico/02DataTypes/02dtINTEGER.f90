	PROGRAM datatypes
	   implicit none
	   integer :: n=7,m
	   
           m=3

	!Operaciones con INTEGER
	!Relacionales (retorna LOGICAL)
           print*, n == m  ! .EQ.
	   print*, n /= m  ! .NE.
	   print*, n <  m  ! .LT.
	   print*, n <= m  ! .LE.
	   print*, n >  m  ! .GT.
	   print*, n >= m  ! .GE.
	
        !Aritméticas: + - * / **
	   print*, n+m
	   print*, n/m

	!Funciones intrinsecas
	   print*, abs(n)   !modulo de n
	   print*, mod(n,m) !resto de n/m

        END PROGRAM datatypes
