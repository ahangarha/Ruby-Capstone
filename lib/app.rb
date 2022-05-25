require_relative './display'
require_relative './create'
require_relative './storage'

class App
  def initialize
    @state = {
      books: [],
      labels: [],
      music: [],
      genres: [],
      authors: [],
      games: []
    }

    load_all_state
  end

  def list_options
    [
      'List all books',
      'List all music albums',
      'List of games',
      'List all genres',
      'List all labels',
      'List all authors',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
  end

  def load_all_state
    @state[:labels] = CreateLabel.create_from(Storage.new('labels').load)
    @state[:genres] = CreateGenre.create_from(Storage.new('genres').load)
    @state[:music] = CreateMusicAlbum.create_from(Storage.new('music').load, @state)
    @state[:books] = CreateBook.create_from(Storage.new('books').load, @state)
    @state[:authors] = CreateAuthor.create_from(Storage.new('authors').load, @state)
    @state[:games] = CreateGame.create_from(Storage.new('games').load, @state)
  end

  def list_all_books
    DisplayBooks.list(@state[:books])
  end

  def list_all_labels
    DisplayLabels.list(@state[:labels])
  end

  def list_all_authors
    DisplayAuthors.list(@state[:authors])
  end

  def list_music_albums
    DisplayMusic.list @state[:music]
  end

  def list_genres
    DisplayGenre.list @state[:genres]
  end

  def list_all_games
    DisplayGames.list @state[:games]
  end

  def add_book
    new_book = CreateBook.create
    @state[:books] << new_book
    @state[:labels] << new_book.label
    @state[:genres] << new_book.genre
  end

  def add_album
    album = CreateMusicAlbum.create
    @state[:music] << album
    @state[:labels] << album.label
    @state[:genres] << album.genre
  end

  def add_game
    game = CreateGame.create
    @state[:games] << game
    @state[:labels] << game.label
    @state[:genres] << game.genre
    @state[:author] << game.author
  end

  def quit
    Storage.new('books').save(@state[:books])
    Storage.new('labels').save(@state[:labels])
    Storage.new('genres').save(@state[:genres])
    Storage.new('music').save(@state[:music])
    exit
  end

  def options
    methods = {}
    methods[1] = method(:list_all_books)
    methods[2] = method(:list_music_albums)
    methods[5] = method(:list_genres)
    methods[6] = method(:list_all_labels)
    methods[9] = method(:add_book)
    methods[10] = method(:add_album)
    methods[13] = method(:quit)

    methods
  end

  def launch_the_option(option)
    if [*1..13].include? option
      options[option].call
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
