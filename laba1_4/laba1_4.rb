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
  end
  puts max2
end

arr=[1,8,-3,9,9,-4]
between_max(arr)