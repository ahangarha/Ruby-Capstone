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

def main
  puts 'Please Select an option menu'
  list_options.each_with_index { |option, i| puts "#{i + 1}-#{option}" }
  keyed_opt = gets.chomp.to_i
  if [*1..12].include? keyed_opt
    puts list_options[keyed_opt - 1]
    puts('*' * 50)
    main
  else
    exit
  end
end

main
