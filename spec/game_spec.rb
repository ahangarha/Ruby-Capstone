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
      last_played_at = Time.now.year - 1
      publish_date = 2020

      the_game = Game.new(multiplayer, last_played_at, publish_date)
      actual = the_game.send(:can_be_archived?)
      expect(actual).to be_falsey
    end
    it 'returns true if parent return true' do
      multiplayer = true
      last_played_at = Time.now.year - 5
      publish_date = 2015

      the_game = Game.new(multiplayer, last_played_at, publish_date)
      actual = the_game.send(:can_be_archived?)
      expect(actual).to be_falsey
    end
    it 'returns true if parent return true' do
      multiplayer = true
      last_played_at = Time.now.year - 5
      publish_date = 2010

      the_game = Game.new(multiplayer, last_played_at, publish_date)
      actual = the_game.send(:can_be_archived?)
      expect(actual).to be_truthy
    end
  end
end
