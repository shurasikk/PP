require_relative 'student'
require_relative 'student_short'

class Students_list_txt
  attr_accessor :list, :file

  def initialize
    self.file=file
  end

  def get_fromID(id)
    self.list.each{|student| if student.ID==id then return student end}
    raise ArgumentError("ID студента не найдено, либо формат ввода неверный")
  end

  def read_list(read: self.file)
    file = File.open(read, "r")
    self.list=file.read
    self.list
  end

  def write_list()
    Student.write_to_txt(self.file, self.list)
  end

  def get_k_n_student_short_list(k, n, data_list:nil)
    accum_list = self.list[((k-1)*n)..(k*n)]
    short_student_list = accum_list.map {|stud| Student_short.from_student(stud)}

    if data_list.nil?
      return Data_List_Student_Short.new(objects: short_student_list)
    else
      return data_list.list.append(*short_student_list)
    end
  end

  def sort_by_shortname
    self.list.sort_by{|obj| obj.get_short}
  end

  def add_student(student:)
    student.ID = get_id
    self.list.append(student)
  end

  def change_byID(student, id)
    if get_fromID(id)!=ArgumentError
      self.list.each_with_index do |stud, index|
        if (stud.id = id)
          self.list[index] = student
        end
      end
    end
  end

  def delete_byID(id)
    self.list.each_with_index do |stud, index|
      if (stud.id = id)
        self.list.delete_at(index)
      end
    end
  end

  def get_student_short_count
    self.list.count
  end

  private
  def get_id
    before_ids = self.list.map {|student| return student.ID}
    id = 0
    while id in before_ids
      id+=1
    end
    id
  end

end
