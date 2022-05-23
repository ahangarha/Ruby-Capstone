class Item
  attr_accessor :publish_date
  attr_reader :archived

  def initialize( id: rand(1..1000), publish_date, archived: false )
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def label=(label)
    @label = label
  end

  private
  def can_be_archived?
    current_year = 2022
    current_year - publish_date > 10
  end
end
