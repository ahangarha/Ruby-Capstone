require './lib/item'

describe Item do
  context 'label setter method' do
    require './lib/label'

    title = 'abc'
    color = 'red'
    the_label = Label.new(title, color)

    published_date = 1234
    the_item = Item.new(published_date)

    the_item.label = the_label

    expected_label_items = [the_item]
    actual_label_items = the_label.items

    it 'adds item to the Lable object as well' do
      expect(actual_label_items).to eq expected_label_items
    end
  end
end
