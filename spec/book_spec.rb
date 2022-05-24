require './lib/book'

describe Book do
  context 'The book class' do
    it 'is actually a class' do
      expect(Book).to be_a Class
    end

    it 'is kind of Item class' do
      publisher = 'abc'
      cover_state = 'efg'
      publish_date = 1234
      actual = Book.new(publisher, cover_state, publish_date)
      expect(actual).to be_an Item
    end

    it 'sets properties properly' do
      publisher = 'abc'
      cover_state = 'efg'
      publish_date = 1234
      expected = [
        publisher,
        cover_state,
        publish_date
      ]

      the_book = Book.new(publisher, cover_state, publish_date)
      actual = [
        the_book.publisher,
        the_book.cover_state,
        the_book.publish_date
      ]

      expect(actual).to eq expected
    end
  end

  context 'can_be_archived method' do
    it 'returns true if parent return true' do
      publisher = 'abc'
      cover_state = 'efg'
      publish_date = Time.now.year - 15

      the_book = Book.new(publisher, cover_state, publish_date)
      actual = the_book.send(:can_be_archived?)
      expected = true
      expect(actual).to be expected
    end

    it 'returns true if cover_state is "bad"' do
      publisher = 'abc'
      cover_state = 'bad'
      publish_date = Time.now.year - 5

      the_book = Book.new(publisher, cover_state, publish_date)
      actual = the_book.send(:can_be_archived?)
      expected = true
      expect(actual).to be expected
    end

    it 'returns false if nither parent class returns true nore cover_state is "bad"' do
      publisher = 'abc'
      cover_state = 'not bad'
      publish_date = Time.now.year - 5

      the_book = Book.new(publisher, cover_state, publish_date)
      actual = the_book.send(:can_be_archived?)
      expected = false
      expect(actual).to be expected
    end
  end
end
