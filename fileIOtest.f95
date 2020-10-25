program file0
    implicit none
    integer i, j, k

    open(17, file='test.dat', status='replace')
    write(17,*) 100, 200, 300
    write(17,*) 400
    write(17,*) 500, 600
    close(17)


    open(18, file='test.dat', status='old')
    read(18, *) i, j, k
    print *, i, j, k 
    read(18, *) i
    print *, i 
    close(18)

end program file0