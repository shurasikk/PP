require_relative 'student'
require_relative 'student_short'
require_relative 'Basic_list'

class Students_list_txt<Basic_format

  def hash_to_format(hash)
    return hash.to_s
  end

  def format_to_hash(str)
    return str.split("\n").map{|line| Student.parse_str(line)}
  end

end
