class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name, id: rand(1..10_000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_hash
    {
      id: @id,
      class: 'Author',
      first_name: first_name,
      last_name: last_name
    }
  end
end
