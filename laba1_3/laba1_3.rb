def minimum(arr)
  min = arr[0]
  for i in 0..arr.length-1.to_i
    if arr[i]<min
      min=arr[i]
    end
  end
  return min
end

def first_pos(arr)
  for i in 0..arr.length-1.to_i
    return arr[i] if arr[i]>0
  end
  return "Нет такого числа"
end
puts minimum([-2,2,-3,4,5,-1,-5])
puts first_pos([-1,2,-5,-9,-3])