program exercise2
    implicit none

    integer(4), parameter ::member=50_4, subject=5_4
    integer :: i, j
    integer(8) :: data(subject, member)
    double precision :: mean(subject), st_div(subject)
    
    !データの入力
    read(*,*) data

    ! 平均 標準偏差を計算
    call calc_mean(subject, member, data, mean)
    call calc_st_div(subject, member, data, mean, st_div)

    ! 標準出力
    do i=1, subject
        write(*,*) 'subject', i 
        write(*,*) '    mean:              ', mean(i)
        write(*,*) '    standard division: ', st_div(i)
    end do 

    !ファイルへの出力

    open(17, file='ex2.dat', status='replace') 
    do i=1, subject
        write(17,*) 'subject', i 
        write(17,*) '    mean:              ', mean(i)
        write(17,*) '    standard division: ', st_div(i)
    end do 
    close(17)
    
    stop



contains
    ! 平均の計算
    subroutine calc_mean(subject, member, data, mean)
        implicit none
        integer,intent(in) :: subject, member
        integer(8),intent(in) :: data(subject, member)
        double precision, intent(inout) :: mean(subject)

        integer :: i
        do i=1, subject
            mean(i) = real(sum(data(i,:)))/real(member)
        end do 

        return
    end subroutine calc_mean


    !標準偏差の計算
    subroutine calc_st_div(subject, member, data, mean, st_div)
        implicit none
        integer,intent(in) :: subject, member
        integer(8),intent(in) :: data(subject, member)
        double precision, intent(in) :: mean(subject)
        double precision, intent(inout) :: st_div(subject)

        integer :: i
        do i=1, subject
            st_div(i) = sqrt( real( sum((data(i, :) - mean(i))**2) ) / real(member))
        end do 

        return
    end subroutine calc_st_div

end program exercise2