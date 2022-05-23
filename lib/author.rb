class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = rand(1..1000)
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
  end
end
