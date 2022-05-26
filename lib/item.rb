class Item
  attr_accessor :publish_date
  attr_reader :archived, :label, :genre, :author, :id
  attr_writer :source

  def initialize(publish_date, archived: false, id: rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    return if label.nil?

    @label = label
    label.add_item(self) unless label.items.include? self
  end

  def genre=(genre)
    return if genre.nil?

    @genre = genre
    genre.add_item(self) unless genre.items.include? self
  end

  def author=(author)
    return if author.nil?

    @author = author
    author.add_item(self) unless author.items.include? self
  end

  def to_hash
    raise NotImplementedError
  end

  private

  def can_be_archived?
    current_year = Time.now.year
    current_year - publish_date > 10
  end
end
