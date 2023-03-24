require_relative 'student'

student = Student.new(name:"Иван", surname:"Иванов", father_name:"Иванович", other:{"id"=>23, "phone"=>"+7-928-431-41-43", "tg"=>"@Drkmo", "git"=>"@SMDPSKM"})
puts student.to_s
puts student.validate?

str="name:Иванов, surname:Иван, father_name:Васильевич, tg:@Kjnk"
second_student = Student.parse_str(str)
puts second_student.to_s

puts student.getInfo