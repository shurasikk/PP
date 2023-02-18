puts "What's your name?"

if ARGV.count < 1
  name = "Anonim"
  else name = ARGV[0]
end
puts "Hello, #{name}! What's your favorite programming language?"
language = gets.chomp
case language
when "C++"
  puts "Хороший выбор. Но скоро будет Ruby"
when "C#"
  puts "Скорее всего вы любите ООП, тогда Ruby скоро станет вашем любимым"
when "F#", "Prolog"
  puts "4 семестр был вашим любимым. Но скоро вашим любимым семестром будет 6, а любимым языком - Ruby"
when "Python"
  puts "Слишком популярный и очевидный ответ. Скоро будет Ruby"
when "JavaScript"
  puts "Любите веб, полюбите и Ruby, который скоро станет самым любимым"
when "Ruby"
  puts "Вы подлиза!"
else
  puts "Скоро будет Ruby"
end
