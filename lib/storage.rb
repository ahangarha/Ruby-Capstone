require 'json'

class Storage
  def initialize(title)
    @title = title
    @filename = "#{@title}.json"
  end

  def save(list_of_objects)
    serialized_data = serialize(list_of_objects)

    File.write(@filename, serialized_data)
  end

  def load
    return [] unless File.exist?(@filename)

    raw_data = File.read(@filename)
    JSON.parse(raw_data)
  end

  def serialize(data)
    data_to_proccess = data.map(&:to_hash)
    JSON.pretty_generate(data_to_proccess)
  end
end
