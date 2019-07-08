        PROGRAM control
                implicit none

                integer :: i
        !DO
        do i=-6,10,2
                print*,i
        end do
    
        !DO WHILE
        i=1
        do while (i<10)
                print*, i
                i=i+1
        end do

        END PROGRAM control
