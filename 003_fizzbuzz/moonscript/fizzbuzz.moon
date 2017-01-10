-- FizzBuzz

printWord = (cond,str) ->
  io.write str if cond
  return cond

for i = 1,100
  newLine = ""
  isFizz = printWord (i%3==0),"Fizz"
  isBuzz = printWord (i%5==0),"Buzz"
  newLine = i unless (isFizz or isBuzz)
  print newLine
