require_relative 'student'

student = Student.new(name:"Иванов", surname:"Иван", father_name:"Иванович", id:23, phone: "+7-928-431-41-43")
puts student.phone_valid?(student.Phone)