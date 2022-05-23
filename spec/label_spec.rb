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
end
