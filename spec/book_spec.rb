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

  context 'to_hash method' do
    publisher = 'abc'
    cover_state = 'efg'
    publish_date = Time.now.year - 15
    the_book = Book.new(publisher, cover_state, publish_date)

    it 'is implemented' do
      expect { the_book.to_hash }.to_not raise_error
    end

    it 'return correct hash for basic Book' do
      expected_items = {
        class: 'Book',
        publisher: publisher,
        publish_date: publish_date,
        cover_state: cover_state,
        archived: false
      }
      expected_id = the_book.id

      hash = the_book.to_hash

      actual_items = {
        class: hash['class'],
        publisher: hash['publisher'],
        publish_date: hash['publish_date'],
        cover_state: hash['cover_state'],
        archived: hash['archived']
      }
      actual_id = hash['id']

      expect(actual_items).to eq expected_items
      expect(actual_id).to be expected_id
    end

    it 'return correct hash for a Book with label' do
      require './lib/label'

      the_label = Label.new('the lable', 'the color')
      the_book = Book.new(publisher, cover_state, publish_date)

      the_book.label = the_label
      hash = the_book.to_hash

      expected_label = the_label.id
      actual_label = hash['label']

      expect(actual_label).to eq expected_label
    end
  end
end
