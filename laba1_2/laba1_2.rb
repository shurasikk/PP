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
    end
  end
  return a
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

def min_del(num)
  min=num
  Math.sqrt(num).to_i.downto(2).each {|i| min = i if num%i==0 and i<min}
  min
end

def task3(num)
  max=1
  num.to_i.downto(2).each {|i| max=i if nod(num, i)!=1 and i%min_del(num)!=0 and i>max}
  sum=0
  num.digits.each{|i| sum+=i if i<5}
  if sum==0 and num.digits.min != 0
    return "Цифры меньше 5 нет"
  elsif max==1
    return "Такого числа нет"
  else
    return max*sum
  end
end

puts task1(12)
puts task2(573)
puts nod(573,571)
puts task3(573)