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

class DisplayLabels < Display
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

class DisplayMusic < Display
  def self.list(music)
    if music.empty?
      puts('*' * 70)
      puts 'No music available, please add some!'
      puts('*' * 70)
    else
      music.each_with_index do |album, i|
        puts("#{i + 1}) #{album.label.title || 'NOT LABELED'}"\
             " #{album.genre.name || ''} PD:#{album.publish_date}")
      end
    end
  end
end

class DisplayGenre
  def self.list(genres)
    if genres.empty?
      puts('*' * 70)
      puts 'No genres available,added genres will be displayed here!'
      puts('*' * 70)
    else
      genres.each_with_index do |genre, i|
        puts "#{i + 1}) #{genre.name}  items: #{genre.items.length}"
      end
    end
  end
end
