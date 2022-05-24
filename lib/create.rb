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
