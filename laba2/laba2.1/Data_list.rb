class Data_List

  def initialize(objects:)
    self.list = objects
    self.selected_id = []
  end

  def select(number)
    @selected_id.append(@List[number].ID)
    return nil
  end

  def get_selected
    return @Selected_id unless @Selected_id.empty?
    []
  end

  def get_names
    ["№", *get_obj_attr_names]
  end

  def get_data
    table=[]
    counter=0
    @list.each {|obj| table.append([counter, *get_obj_attr(obj)]); counter+=1}
    Data_table.new(table:table)
    table
  end

  protected
  def list
    @list
  end

  def list=(list)
    @list = list
  end

  private
  def selected_id
    @selected_id
  end

  def selected_id=(selected_id)
    @selected_id = selected_id
  end

  protected
  def get_obj_attr(obj)
  end

  def get_obj_attr_names()
  end

end