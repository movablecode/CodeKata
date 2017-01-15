--  bubble_sort.moon

--  prepare number array
-- arr = {}
-- for i = 1,#arg
--   arr[i] = (tonumber arg[i]) or 0
-- if #arr<1
--   arr = {5,8,9,7,4,1,3,2}

--
--  sort
--
swapElement = (arr,i1,i2)->
  c = arr[i1]
  arr[i1] = arr[i2]
  arr[i2] = c
  return true

bubble_sort = (arr)->
  swapped = true
  while swapped
    swapped = false
    for i = 1,#arr-1
      if arr[i+1]<arr[i]
        swapped = swapElement arr,i,i+1
  return arr

describe "bubble sort", ->
  it "test 1", ->
    arr = bubble_sort {5,8,9,7,4,1,3,2}
    assert.True arr[1]==1
    assert.True arr[2]==2
    assert.True arr[#arr]==9

