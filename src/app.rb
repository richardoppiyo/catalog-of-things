require_relative './item'
require_relative './author'
require_relative './game'
require_relative './author_save_data'
require_relative './game_save_data'
require 'json'

class App
  include AuthorsData
  include GameData

  def initialize
    @authors = []
  end

  def list_all_books
    puts 'List of books'
  end

  def list_all_music_albums
    puts 'List of music albums'
  end

  def list_of_games
    puts 'Games list is empty' if @games.empty?
    @games.each do |game|
      puts "Multiplayer : #{game.multiplayer},
      Last played at : #{game.last_played_at},
      Publish date : #{game.publish_date}"
    end
  end

  def list_all_genres
    puts 'List of genres'
  end

  def list_all_labels
    puts 'List of labels'
  end

  def list_all_authors
    puts 'Authors list is empty' if @authors.empty?
    @authors.each do |author|
      puts "First name : #{author.first_name}, Last name : #{author.last_name}"
    end
  end

  def add_book
    puts 'Add book'
  end

  def add_music_album
    puts 'Add music album'
  end

  def add_game
    puts 'Is it a multiplayer game? [Enter answer as y/n]'
    key = gets.chomp
    case key
    when 'y'
      multiplayer = true
    when 'n'
      multiplayer = false
    else
      puts 'Unknown answer'
    end
    puts 'When was it last played? [Enter answer as yyyy/mm/dd]'
    last_played_at = gets.chomp
    puts 'When was it published? [Enter answer as yyyy/mm/dd]'
    publish_date = gets.chomp
    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    write_games(@games)
    puts 'Game added'
  end
end
