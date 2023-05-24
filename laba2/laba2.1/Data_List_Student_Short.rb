require_relative 'Data_list'

class Data_List_Student_Short<Data_List

  attr_accessor :view

  def notify
    self.view.set_table_params(self.get_objects_attr_names.map{|x| x.to_s}, self.list.size)
    self.view.set_table_data(self.get_data)
  end

  private
  def get_obj_attr(obj)
    return [obj.to_s]
  end

  def get_obj_attr_names
    return ["short_name", "git", "contact"]
  end

end