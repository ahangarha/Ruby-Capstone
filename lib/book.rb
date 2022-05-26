require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived: false, id: rand(1..10_000))
    super(publish_date, archived: archived, id: id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_hash
    hash = {
      'class' => 'Book',
      'id' => @id,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state,
      'archived' => @archived
    }

    hash['label'] = @label.id unless @label.nil?
    hash['genre'] = @genre.id unless @genre.nil?
    hash['author'] = @author.id unless @author.nil?

    hash
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
