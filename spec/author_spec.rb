require_relative '../lib/author'
require_relative '../lib/item'
require 'rspec/autorun'

describe Author do
  context 'while creating a new author' do
    it 'should return a new object' do
      author = Author.new('Harry', 'Potter')
      expect(author).to be_an_instance_of(Author)
    end

    it 'return the correct details in author' do
      author = Author.new('Harry', 'Potter')
      expect(author.first_name).to eql('Harry')
      expect(author.last_name).to eql('Potter')
    end
  end

  context 'add item' do
    it 'should add an item' do
      author = Author.new('Harry', 'Potter')
      item = Item.new('2022')
      author.add_item(item)
      expect(author.items).to include(item)
      expect(item.author).to be(author)
    end
  end
end