require_relative './display'
require_relative './create'
require_relative './storage'

class App
  def initialize
    @state = {
      books: [],
      labels: [],
      music: [],
      genres: []

    }

    load_all_state
  end

  def list_options
    [
      'List all books',
      'List all music albums',
      'List all movies',
      'List of games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources ',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'Exit'
    ]
  end

  def load_all_state
    @state[:books] = CreateBook.create_from(Storage.new('books').load)
  end

  def list_all_books
    DisplayBooks.list(@state[:books])
  end

  def list_all_labels
    DisplayLabels.list(@state[:labels])
  end

  def add_book
    @state[:books] << CreateBook.create
  end

  def list_music_albums
    DisplayMusic.list @state[:music]
  end

  def list_genres
    DisplayGenre.list @state[:genres]
  end

  def add_album
    data = CreateMusicAlbum.create
    @state[:music] << data[:album]
    @state[:labels] << data[:label]
    @state[:genres] << data[:genre]
  end

  def quit
    Storage.new('books').save(@state[:books])
    Storage.new('labels').save(@state[:labels])

    exit
  end

  def launch_the_option(option)
    case option
    when 1
      list_all_books
    when 2
      list_music_albums
    when 5
      list_genres
    when 6
      list_all_labels
    when 9
      add_book
    when 10
      add_album
    when 13
      quit
    else
      puts 'Invalid option!'
    end
  end

  def home
    puts 'Please Select an option menu'
    list_options.each_with_index { |option, i| puts "#{i + 1}-#{option}" }
    chosen_option = gets.chomp.to_i
    launch_the_option(chosen_option)
    home
  end

  def run
    home
  end
end
