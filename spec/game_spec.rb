require_relative '../lib/game'
require 'rspec/autorun'

describe Game do
  context 'when creating a new game' do
    it 'returns a new object' do
      game = Game.new(false, '2021', '2019')
      expect(game).to be_an_instance_of(Game)
    end

    it 'Check for the correct data' do
      game = Game.new(false, '2021', '2019')
      expect(game.multiplayer).to be false
    end
  end
  context 'can_be_archived? method' do
    it 'returns true if parent return true' do
      multiplayer = false
      last_played_at = 2021
      publish_date = 2020

      the_game = Game.new(multiplayer, last_played_at, publish_date)
      actual = the_game.send(:can_be_archived?)
      expect(actual).to be_falsey
    end
  end
end
