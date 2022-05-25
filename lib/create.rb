require_relative './label'
require_relative './genre'

class Create
  def self.create
    raise NotImplementedError
  end

  def self.create_from(list_of_hashes)
    raise NotImplementedError
  end
end

class CreateBook < Create
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

  def self.create_from(books)
    books.map do |book|
      Book.new(
        book['publisher'],
        book['cover_state'],
        book['publish_date'],
        archived: book['archived'],
        id: book['id']
      )
    end
  end
end

class CreateLabel < Create
  def self.create
    print 'title: '
    title = gets.chomp.strip
    print 'label-color: '
    color = gets.chomp.strip
    Label.new title, color
  end
end

class CreateGenre < Create
  def self.create
    print 'Genre: '
    genre_name = gets.chomp.strip
    Genre.new genre_name
  end
end

class CreateMusicAlbum < Create
  require_relative './music_album'

  def self.create
    label = CreateLabel.create
    genre = CreateGenre.create

    print 'Publish Date: '
    publish_date = gets.chomp.strip
    album = MusicAlbum.new publish_date
    album.genre = genre
    album.label = label
    puts "#{'-' * 20}Book has been created 🎉#{'-' * 20}"

    album
  end
end
