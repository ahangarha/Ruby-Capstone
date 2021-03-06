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
    expected_item_label = the_label

    the_label.add_item(the_item)
    actual_items = the_label.items
    actual_item_label = the_item.label

    it 'adds the given item to the items array' do
      expect(actual_items).to eq expected_items
    end

    it 'adds itself to the item label' do
      expect(actual_item_label).to eq expected_item_label
    end
  end

  context 'to_hash method' do
    it 'generates correct hash of Label object' do
      title = 'abc'
      color = 'red'
      the_label = Label.new(title, color)

      expected_hash = {
        id: the_label.id,
        class: 'Label',
        title: title,
        color: color
      }

      actual_hash = the_label.to_hash

      expect(actual_hash).to eq expected_hash
    end
  end
end
