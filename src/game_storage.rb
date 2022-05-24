
require_relative './game'
require 'json'

module GameData
  def read_games
    data = []
    if File.exist?('games.json')
      games_data = JSON.parse(File.read('games.json'))
      games_data.each do |game|
        data.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
      end
    end
    data
  end

  def write_games(games)
    games_data = []
    games.each do |game|
      games_data.push(
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at,
          publish_date: game.publish_date
        }
      )
    end
    File.write('games.json', JSON.generate(games_data))
  end
end