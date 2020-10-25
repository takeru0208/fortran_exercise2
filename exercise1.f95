program exercise1
  implicit none

  integer :: i, j
  integer(8) :: data(5, 50), outdata(6, 50)
  !ファイルの読み込み
  !data: inputファイル 
  !outdata: outputファイル
  read(*,*) data
  !outdataの6列目に各生徒の総合点を追加
  do i = 1, 50  
    do j = 1, 5
      outdata(j,i) = data(j,i)
    end do
    outdata(6,i) = sum(data(:,i))
  end do 

  ! ex1.datとしてoutdataを一旦出力
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
  !heapsortとして6列目を降順に並び替え
  call heapsort(50, outdata)
  !sorted_ex1.datとして並び替え済みデータを出力
  open(17, file='sorted_ex1.dat', status='replace') 
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
  stop


! ヒープソートを行う
! 引数
! n: 生徒数、今回50
! array: 並び替えするデータ
contains
  subroutine heapsort(n,array)
    implicit none
    integer,intent(in) :: n
    integer(8),intent(inout) :: array(6, n)
    
    integer ::i,k,j,l, p
    integer(8) :: t(6)
    !エラー処理
    if(n.le.0)then
      write(6,*)"Error, at heapsort"; stop
    endif
    if(n.eq.1)return

    !以下ヒープソート
    l=n/2+1
    k=n
    do while(k.ne.1)
      if(l.gt.1)then
          l=l-1
          do p = 1, 6 
            t(p)=array(p, L)
          end do
      else
        do p = 1, 6
          t(p)=array(p, k)
          array(p, k)=array(p, 1)
        end do 
        
        k=k-1
        if(k.eq.1) then
          do p = 1, 6
            array(p, 1)=t(p)
          end do
          exit
        endif
      end if
      i=l
      j=l+l
      do while(j.le.k)
          if(j.lt.k)then
            if(array(6, j).lt.array(6, j+1))j=j+1
          end if
          if (t(6).lt.array(6, j))then
            do p= 1, 6
              array(p, i)=array(p, j)
            end do
            i=j
            j=j+j
          else
            j=k+1
          end if
      end do
      do p = 1, 6
        array(p, i)=t(p)
      end do
    enddo
    !サブルーチンのため返し値はない。
    return
  end subroutine heapsort

end program exercise1