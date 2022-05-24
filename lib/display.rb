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
        id = book.id
        label = book.label || 'NO LABEL!'
        archived_status = book.archived ? '[ARCHIVED]' : ''
        puts "#{id}\t#{label}\tpublished at #{book.publish_date}\t#{archived_status}"
      end
    end
  end
end

class DisplayLabels
  def self.list(labels)
    if labels.empty?
      puts 'No book available!'
    else
      labels.each do |label|
        title = label.title || 'NO TITLE!'
        color = label.color || 'NO COLOR!'
        puts "#{title}\t[#{color}]"
      end
    end
  end
end
