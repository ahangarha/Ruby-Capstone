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
    @state[:authors] = CreateAuthor.create_from(Storage.new('authors').load)
    @state[:music] = CreateMusicAlbum.create_from(Storage.new('music').load, @state)
    @state[:books] = CreateBook.create_from(Storage.new('books').load, @state)
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
    @state[:authors] << new_book.author
  end

  def add_album
    album = CreateMusicAlbum.create
    @state[:music] << album
    @state[:labels] << album.label
    @state[:genres] << album.genre
    @state[:authors] << album.author
  end

  def add_game
    game = CreateGame.create
    @state[:games] << game
    @state[:labels] << game.label
    @state[:genres] << game.genre
    @state[:authors] << game.author
  end

  def quit
    Storage.new('books').save(@state[:books])
    Storage.new('labels').save(@state[:labels])
    Storage.new('genres').save(@state[:genres])
    Storage.new('music').save(@state[:music])
    Storage.new('authors').save(@state[:authors])
    Storage.new('games').save(@state[:games])
    exit
  end

  def options
    {
      1 => method(:list_all_books),
      2 => method(:list_music_albums),
      3 => method(:list_all_games),
      4 => method(:list_genres),
      5 => method(:list_all_labels),
      6 => method(:list_all_authors),
      7 => method(:add_book),
      8 => method(:add_album),
      9 => method(:add_game),
      10 => method(:quit)
    }
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
