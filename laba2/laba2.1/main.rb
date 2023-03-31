require_relative 'student'
require_relative 'student_short'

student = Student.new(name:"Иван", surname:"Иванов", father_name:"Иванович", other:{"id"=>23, "phone"=>"+7-928-431-41-43", "tg"=>"@Drkmo", "git"=>"@SMDPSKM"})
puts student.to_s
puts student.validate?

str="name:Иванов, surname:Иван, father_name:Васильевич, tg:@Kjnk, git:@Rgji"
second_student = Student_short.from_s(str)
puts second_student.to_s

puts student.getInfo

students=Student.read_from_txt("some_students.txt")
students.each { |x| puts x.to_s }