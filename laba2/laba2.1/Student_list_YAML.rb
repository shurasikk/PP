class Student_list_YAML<Basic_format
  require_relative 'Basic_list'
  require_relative 'student'
  require_relative 'Data_List_Student_Short'
  require_relative 'student_short'
  require 'yaml'

  def hash_to_format(hash)
    return hash.to_yaml
  end

  def format_to_hash(str)
    return YAML.parse(str)
  end

end