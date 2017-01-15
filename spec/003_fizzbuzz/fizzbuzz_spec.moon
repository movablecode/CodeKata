-- FizzBuzz

printWord = (cond,strYes,strNo="") ->
  str2 = strYes
  str2 = strNo unless cond
  io.write str2
  return cond

for i = 1,100
  isFizz = printWord (i%3==0),"Fizz"
  isBuzz = printWord (i%5==0),"Buzz"
  printWord (isFizz or isBuzz),"\n",i.."\n"
