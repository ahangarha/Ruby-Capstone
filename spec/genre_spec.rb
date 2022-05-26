require_relative '../lib/genre'
require_relative '../lib/item'
describe Genre do
  before :all do
    @genre = Genre.new 'sci-fi'
    @item = Item.new 2022
  end
  context 'Class object' do
    it 'genre should be an instance of class Genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'Items should be empty' do
      expect(@genre.items).to be_empty
    end

    it 'genre name should be sci-fi' do
      expect(@genre.name).to eql 'sci-fi'
    end
  end

  context 'Add item to genre' do
    it 'genre items length should be == 1 after adding item' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eql 1
    end

    it 'same item should not be added once it exists in item list, items should still be == 1' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eql 1
    end

    it 'item genre should be eql to the genre being added to' do
      expect(@item.genre).to eql @genre
    end
  end
end
