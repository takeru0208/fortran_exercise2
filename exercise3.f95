program exercise3
implicit none

integer(4), parameter ::member=50_4, subject=5_4
integer :: i, j
integer(4) :: data(subject, member), sumdata(subject+1, member), hist_data(subject, 100)=0, hist_sum_data(subject*100)=0

!ファイルの読み込み
!data: inputファイル 
!hist_sum_data: outputファイル

read(*,*) data

!sumdataの6列目に各生徒の総合点を追加
do i = 1, member  
    do j = 1, subject
        sumdata(j,i) = data(j,i)
    end do
    sumdata(subject+1,i) = sum(data(:,i))
end do 


! histgram用のデータ作成
call make_hist(subject, member, sumdata, hist_data, hist_sum_data)

! python用ファイルの作成
open(17, file='ex3_for_python.dat', status='replace') 
  do i = 1, 50
    write(17, *) sumdata(1, i), sumdata(2, i), sumdata(3, i), sumdata(4, i), sumdata(5, i), sumdata(6, i)
  end do
close(17)

! gnuplotで出力するためにex3_hist.datを作成
open(17, file='ex3_hist.dat', status='replace') 
    do i = 1, 100
        write(17, *) i, hist_data(1, i), hist_data(2, i), hist_data(3, i), hist_data(4, i), hist_data(5, i)
        
    end do
close(17)

! gnuplotで出力するためにex3_sum_hist.datを作成
open(17, file='ex3_sum_hist.dat', status='replace') 
    do i = 1, subject*100
        write(17, *) i, hist_sum_data(i)
    end do
close(17)

stop


! ヒープソートを行う
! 引数
! n: 生徒数、今回50
! array: 並び替えするデータ
contains
subroutine make_hist(subject, member, sumdata, hist_data, hist_sum_data)
    implicit none
    integer,intent(in) :: subject, member
    integer,intent(in) :: sumdata(subject+1, member)
    integer,intent(inout) :: hist_data(subject, 100)
    integer,intent(inout) :: hist_sum_data(subject*100)
    
    integer ::i,j,k,l, p
    ! 各教科のヒストグラム用データhist_data作成
    do i = 1, subject
        do j = 1, 100
            do k = 1, member
                if(j == sumdata(i, k)) then
                    hist_data(i, j) =+ 1
                end if
            end do
        end do
    end do 

    ! ヒストグラム用データhist_sum_data作成
    do i = 1, subject*100
        do j = 1, member
            if(i == sumdata(6, j)) then
                hist_sum_data(i) =+ 1
            end if
        end do
    end do 

    !サブルーチンのため返し値はない。
    return
end subroutine make_hist

end program exercise3