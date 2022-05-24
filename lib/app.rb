require_relative './display'
require_relative './create'

class App
  def initialize
    @state = {
      books: [],
      labels: []
    }

    @list_options = [
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

  def list_all_books
    DisplayBooks.list(@state[:books])
  end

  def list_all_labels
    DisplayLabels.list(@state[:labels])
  end

  def add_book
    @state[:books] << CreateBook.create
  end

  def launch_the_option(option)
    case option
    when 1
      list_all_books
    when 6
      list_all_labels
    when 9
      add_book
    when 13
      exit
    else
      puts 'Invalid option!'
    end
  end

  def home
    puts 'Please Select an option menu'
    @list_options.each_with_index { |option, i| puts "#{i + 1}-#{option}" }
    chosen_option = gets.chomp.to_i
    launch_the_option(chosen_option)
    home
  end

  def run
    home
  end
end
