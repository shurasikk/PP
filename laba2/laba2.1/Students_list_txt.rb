require_relative 'student'
require_relative 'student_short'
require_relative 'Basic_list'

class Students_list_txt<Basic_list

  def read_list
    file = File.open(self.file, "r")
    self.list=Student.read_from_txt(path_name: file)
  end

  def write_list
    Student.write_to_txt(self.file, self.list)
  end

end
