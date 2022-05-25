class Create
  def self.create
    raise NotImplementedError
  end

  def self.create_from(books_list)
    raise NotImplementedError
  end
end

class CreateBook
  require_relative './book'

  def self.create
    print 'Publisher: '
    publisher = gets.chomp.strip
    print 'Cover State: '
    cover_state = gets.chomp.strip
    print 'Publish Date: '
    publish_date = gets.chomp.strip

    Book.new(publisher, cover_state, publish_date)
  end
end

class CreateMusicAlbum < Create
  require_relative './label'
  require_relative './genre'
  require_relative './music_album'

  def self.create
    print 'title: '
    title = gets.chomp.strip
    print 'label-color: '
    color = gets.chomp.strip
    label = Label.new title, color
    print 'genre: '
    genre_name = gets.chomp.strip
    genre = Genre.new genre_name
    print 'Publish Date: '
    publish_date = gets.chomp.strip
    album = MusicAlbum.new publish_date
    album.genre = genre
    album.label = label
    puts "#{'-' * 20}Book has been created 🎉#{'-' * 20}"
    {
      genre: genre,
      album: album,
      label: label
    }
  end
end
