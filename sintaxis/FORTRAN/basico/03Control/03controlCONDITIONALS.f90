        PROGRAM control
                implicit none
                real    :: x
                
                x=1.0
                
               !CONDICIONALES (IF,ELSE,ELSE IF)
              if (x>0) then
                        print*, "x es positivo"
               else if (x<0) then
                        print*, "x es negativo"
               else
                        print*, "x es cero"
              end if

               !SWITCHES (SELECT/CASE)
                
               select case(x)
                 case(>0)
                        print*, "x es positivo"
                 case(<0)
                        print*, 'x es negativo'
                 case default
                        print*, "x es cero"
               end select

        END PROGRAM control
