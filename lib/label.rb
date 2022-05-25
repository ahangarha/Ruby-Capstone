class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id: nil)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    {
      id: @id,
      class: 'Label',
      title: @title,
      color: @color
    }
  end
end
