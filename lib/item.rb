class Item
  attr_accessor :publish_date
  attr_reader :archived, :label
  attr_writer :author, :source

  def initialize(publish_date, archived: false, id: rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include? self
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  private

  def can_be_archived?
    current_year = Time.now.year
    current_year - publish_date > 10
  end
end
