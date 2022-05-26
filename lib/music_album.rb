class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false, archived: false, id: rand(1..10_000))
    super(publish_date, archived: archived, id: id)
    @on_spotify = on_spotify
  end

  def to_hash
    hash = {
      'class' => 'MusicAlbum',
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'genre' => @genre.id,
      'label' => @label.id,
      'on_spotify' => @on_spotify
    }

    hash['label'] = @label.id unless @label.nil?
    hash['ganre'] = @ganre.id unless @ganre.nil?
    hash['author'] = @author.id unless @author.nil?

    hash
  end

  def self.from_json(json)
    MusicAlbum.new(
      json['publish_date'],
      id: json['id'],
      on_spotify: json['on_spotify'],
      archived: json['archived']
    )
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
