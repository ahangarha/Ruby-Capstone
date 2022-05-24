class Genre
  attr_accessor :name

  def initialize(name)
    @id = rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include? item
  end
end
