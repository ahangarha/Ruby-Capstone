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
end
