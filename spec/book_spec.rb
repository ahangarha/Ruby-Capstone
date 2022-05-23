require './lib/book'

describe Book do
  context 'The book class' do
    it 'is actually a class' do
      expect(Book).to be_a Class
    end

    it 'is kind of Item class' do
      actual = Book.new(1234)
      expect(actual).to be_an Item
    end
  end
end
