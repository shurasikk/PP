class Basic_list
  require_relative 'student'
  require_relative 'Data_List_Student_Short'
  require_relative 'student_short'
  require_relative 'Basic_format'

  attr_accessor :list, :file, :format

  protected
  def initialize(file:)
    self.file = file
    raise FileNotFoundError unless File.exist?(file)
  end

  public
  def get_fromID(id)
    self.list.each{|student| if student.ID==id then return student end}
    raise ArgumentError("ID студента не найдено, либо формат ввода неверный")
  end


  def get_k_n_student_short_list(k:, n:, data_list: nil)
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
    self.list.each_with_index do |stud, index|
      if (stud.ID = id)
        self.list[index] = student
      end
    end
  end

  def delete_byID(id)
    self.list.each_with_index do |stud, index|
      if (stud.ID = id)
        self.list.delete_at(index)
      end
    end
  end

  def get_student_short_count
    self.list.count
  end

  def write_list
    objects_array = self.list.map do |stud|
    arr = stud.map do |name, value|
      [name.to_s, value]
    end
    arr.to_h
  end
  text = format.hash_to_format(objects_array)
  file_text = File.open(self.file, "w")
  file_text.write(text)
  file_text.close
  end

  def read_list
    file = File.open(self.file, "r")
    text = file.read
    hash = format.format_to_hash(text)
    self.list = hash.map{|stud| Student.new(**stud)}
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
