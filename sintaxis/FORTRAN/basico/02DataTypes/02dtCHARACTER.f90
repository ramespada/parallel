       program datatypes  
      
         implicit none

         character*30       :: str1="Esto es un string       "
         character (len=30) :: str2=", este es otro string.  "
  
         print*, str1
         
         !Operaciones con CHARACTER:
         print*, str1(9:25)
         print*, str1//str2
         print*, trim(str1)//trim(str2)
  
         print*, len(str1)
         print*, len(trim(str1))

         print*, repeat(str2(11:15),4)
         
         print*, scan(str1, 'aeiou')
         print*, index(str2, 'otro',back=.true.)
         print*, verify(str1,'Esto es un strang')
       end program datatypes
