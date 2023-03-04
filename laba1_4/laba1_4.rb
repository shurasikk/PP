def index_desc(arr)
  d=arr.sort.reverse
  d.each {|x| puts arr.index(x)}
end

index_desc([1,5,-3,8,9,-4])