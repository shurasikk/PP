require 'open3'

puts "#{ARGV[0]} введите команду языка Ruby"
rubyCmd = gets.chomp()
File.open("do.rb","w") do |file|
  file.write(rubyCmd)
end
cmd = "ruby do.rb"
Open3.pipeline(cmd)

puts "Введите команду операционной системы для её выполнения"
cmd2 = gets.chomp()
Open3.pipeline(cmd2)
