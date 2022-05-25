class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name, id = rand(1..10_000), items = [])
    super()
    @id = id
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.genre = self
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name
    }
  end

  def self.from_json(json)
    Genre.new(json['name'], id: json['id'])
  end
end
