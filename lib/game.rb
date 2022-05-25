require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date,  id: rand(1..10_000))
    super(publish_date, id: id)
    @id = id
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_hash
    hash = { 
      'class' => 'Game',
      'id' => @id,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'archived' => @archived,
      'publish_date' => @publish_date,
    }
  end

  private
  def can_be_archived?
    difference = 2022 - @last_played_at
    super && (diff > 2)
  end
end
