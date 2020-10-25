program hello
  print *, 'hello'
  print *, 'hello2'
  write(*, fmt='(a)', advance='no') 'hello3'
  write(*,*) 'hello4'
end program hello
