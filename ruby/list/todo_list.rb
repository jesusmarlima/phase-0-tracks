class TodoList
  def initialize(to_do)
    puts "initializing"
    @to_do_list = to_do
  end

  def get_items
    @to_do_list
  end

  def add_item(item)
    @to_do_list << item
    @to_do_list
  end

  def delete_item(item)
    @to_do_list.delete(item)
    @to_do_list
  end

  def get_item(index)
    @to_do_list[index]
  end
end