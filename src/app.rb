require_relative './item'
require_relative './author'
require_relative './game'
require_relative './author_storage'
require_relative './game_storage'

class App
  include AuthorsData
  include GameData

  def initialize
    @authors = read_authors
    @games = read_games
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
      puts game
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
      puts author
    end
  end

  def add_book
    puts 'Add book'
  end

  def add_music_album
    puts 'Add music album'
  end

  def add_game
    puts 'Is it a multiplayer game? [Enter answer as true or false]'
    multiplayer = gets.chomp.to_s.casecmp('true').zero?
    puts 'When was it last played? [Enter answer as yyyy/mm/dd]'
    last_played_at = gets.chomp
    puts 'When was it published? [Enter answer as yyyy/mm/dd]'
    publish_date = gets.chomp
    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    write_games(@games)
    puts 'Game added'
  end
end
