# CUDA

> CUDA es un modelo escalable para programación paralela

Programación *hterogenea*:


Ejemplo:

```fortran
  program hola

    use cudafor
    
    implicit none
    integer :: parameter :: n=256
    real :: a(n), b(n)
    real, device :: a_d(n), b_d(n)

    a=1.0
    a_d=a
    b_d=a_d
    b=b_d
  
    if (all(a==b)) then
      write(*,*) "Test passed"
    end if
  end program

```



