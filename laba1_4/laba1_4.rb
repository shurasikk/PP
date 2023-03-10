def index_desc(arr)
  d=arr.sort.reverse
  d.each {|x| puts arr.index(x)}
end

index_desc([1,5,-3,8,9,-4])

def between_max(arr)
  max1=arr.index(arr.max)
  max2 = arr.select {|x| x<arr.max}.max
  if max1==arr.index(max2)+1 or arr.index(max2)==max1+1
    puts "Два максимальных элемента массива - соседи"
  else arr.each_index {|i| if (i<max1 and i>arr.index(max2)) or (i>max1 and i<arr.index(max2))
                               puts arr[i] end}
  end
end

arr=[1,9,-3,7,8,-4]
between_max(arr)


def between_two_maxes(arr)
  max1=arr.index(arr.max)
  max2=arr.rindex(arr.max)
  if max1==max2+1
    puts "Два максимальных элемента массива - соседи"
  else arr.each_index{ |i| if i>max1 and i<max2
                               puts arr[i] end}
  end
end


between_two_maxes([1,9,-3,7,8,9])