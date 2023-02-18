def minimum(arr)
  min = arr[0]
  for i in 1..arr.length-1.to_i
    if arr[i]<min
      min=arr[i]
    end
  end
  return min
end



puts minimum([-2,2,-3,4,5,-1,0])