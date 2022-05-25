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
    label = CreateLabel.create
    genre = CreateGenre.create

    print 'Publisher: '
    publisher = gets.chomp.strip
    print 'Cover State: '
    cover_state = gets.chomp.strip
    print 'Publish Date: '
    publish_date = gets.chomp.strip

    book = Book.new(publisher, cover_state, publish_date)
    book.label = label
    book.genre = genre

    book
  end

  def self.create_from(books, state)
    books.map do |book|
      new_book = Book.new(
        book['publisher'],
        book['cover_state'],
        book['publish_date'],
        archived: book['archived'],
        id: book['id']
      )
      the_label = state[:labels].find { |l| l.id == book['label'] }
      new_book.label = the_label

      new_book
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

  def self.create_from(labels)
    labels.map do |label|
      Label.new(
        label['title'],
        label['color'],
        id: label['id']
      )
    end
  end
end

class CreateGenre < Create
  def self.create
    print 'Genre: '
    genre_name = gets.chomp.strip
    Genre.new genre_name
  end

  def self.create_from(genres)
    genres.map { |json| Genre.from_json json }
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

  def self.create_from(music, state)
    music.map do |json|
      album = MusicAlbum.from_json json
      label = state[:labels].find { |l| l.id == json['label'] }
      genre = state[:genres].find { |l| l.id == json['genre'] }
      album.genre = genre || Genre.new('default')
      album.label = label

      album
    end
  end
end
