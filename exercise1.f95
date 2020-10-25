program exercise1
  implicit none


  integer :: i, j
  integer(8) :: data(5, 50), outdata(6, 50)
  read(*,*) data
  
  do i = 1, 50  
    do j = 1, 5
      outdata(j,i) = data(j,i)
    end do
    outdata(6,i) = sum(data(:,i))
  end do 
  ! do i = 1, 50
  !   write(*,*) outdata(6, i)
  ! end do 

  open(17, file='ex1.dat', status='replace') 
  do i = 1, 50
    do j = 1, 6
      write(17, fmt='(i3)', advance='no') outdata(j, i)
      if(j >=6) then
        exit
      end if
      write(17, fmt='(a)', advance='no') ', '
    end do
    write(17, *) ''
  end do
  close(17)
  call hello('Meichel')
  stop

contains
  subroutine hello(name)          ! helloという名前でサブルーチンを宣言
    implicit none                 ! 暗黙の型宣言の禁止
    character(len=*) :: name      ! 引数を宣言 (任意長の文字列)

    write(*,*) 'Hello ', name     ! 内部の処理

    return
  end subroutine hello

end program exercise1