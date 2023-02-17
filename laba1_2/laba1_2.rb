def simple(num)
  return false if num <= 1
  Math.sqrt(num).to_i.downto(2).each {|i| return false if num % i == 0}
  true
end

def nod(a,b)
  while a != b
    if a > b
      a = a - b
    else
      b = b - a
      return a
    end
  end
  end

def task1(num)
  k = 0
  num.to_i.downto(1).each {|i| k+=1 if nod(num,i) != 1 and i%2==0 }
  return k
end

def task2(num)
  res=-1
  num.digits.each{|i| res=i if i % 3 != 0 and i>res}
  if res == -1
    return "Такой цифры нет"
  else
    return res
  end
end

puts task1(12)
puts task2(573)
