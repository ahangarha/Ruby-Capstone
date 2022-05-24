class Display
  def self.list
    raise NotImplementedError
  end
end

class DisplayBooks
  def self.list(books)
    if books.empty?
      puts 'No book available!'
    else
      books.each do |book|
        label = book.label || 'NO LABEL!'
        archived_status = book.archived ? '[ARCHIVED]' : ''
        puts "#{label}\tpublished at #{book.publish_date}\t#{archived_status}"
      end
    end
  end
end
