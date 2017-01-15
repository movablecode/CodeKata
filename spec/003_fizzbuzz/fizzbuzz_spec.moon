-- FizzBuzz

ln = ""
printWord = (cond,strYes,strNo="") ->
  str2 = strYes
  str2 = strNo unless cond
  ln ..= str2
  -- io.write str2
  return cond

str_array = {}

for i = 1,100
  ln = ""       -- clear
  isFizz = printWord (i%3==0),"Fizz"
  isBuzz = printWord (i%5==0),"Buzz"
  -- printWord (isFizz or isBuzz),"\n",i.."\n"
  printWord (isFizz or isBuzz),"",(tostring i)
  str_array[#str_array+1] = ln

describe "fizzbuzz 1 to 100",->
  it "check 1", ->
    assert.True str_array[1]=="1"

