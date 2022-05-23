require './lib/label'

describe Label do
  context 'The Label class' do
    it 'is actually a class' do
      expect(Label).to be_a Class
    end

    it 'gets initialized' do
      title = 'abc'
      color = 'red'

      actual = Label.new(title, color)

      expect(actual).to be_a Label
    end

    it 'sets properties as expected' do
      title = 'abc'
      color = 'red'
      expected_static_properties = [
        title,
        color,
        []
      ]

      the_label = Label.new(title, color)
      actual_static_properties = [
        the_label.title,
        the_label.color,
        the_label.items
      ]
      actual_id = the_label.id

      expect(actual_static_properties).to eq expected_static_properties
      expect(actual_id).to be_a Integer
      expect(actual_id).to be > 0
    end
  end

  context 'The add_item method' do
    require './lib/item'

    title = 'abc'
    color = 'red'
    the_label = Label.new(title, color)

    published_date = 1234
    the_item = Item.new(published_date)

    expected_items = [the_item]

    the_label.add_item(the_item)
    actual_items = the_label.items

    it 'adds the given item to the items array' do
      expect(actual_items).to eq expected_items
    end
  end
end
