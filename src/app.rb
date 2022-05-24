require_relative './genre'
require_relative './music_album'
require_relative './item'
require_relative './author'
require_relative './game'
require 'json'

class App
  def initialize
    @genres = []
    if File.exist?('./music_albums.json')
      @genres = JSON.parse(File.read('./music_albums.json'), create_additions: true)
    else
      load_default_genres
    end
  end

  def load_default_genres
    @genres.push(Genre.new(1, 'Classic'))
    @genres.push(Genre.new(2, 'Rock & Roll'))
    @genres.push(Genre.new(3, 'Latin'))
    @genres.push(Genre.new(4, 'Electronic'))
    @genres.push(Genre.new(5, 'Jazz'))
    @genres.push(Genre.new(6, 'Hip Hop'))
    @genres.push(Genre.new(7, 'Pop'))
  end

  def save_data
    File.write('./music_albums.json', JSON.generate(@genres)) unless @genres.empty?
    
  def list_all_books
    puts 'List of books'
  end

  def list_all_music_albums
    puts 'List of music albums'
    @genres.each do |genre|
      puts genre.items
    end
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
    @genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
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
    puts "\nPlease enter publish date (yyyy/mm/dd):"
    publish_date = gets.chomp
    puts 'Archived item (y/n)'
    archived = gets.chomp.downcase == 'y'
    puts 'It is on Spotify? (y/n)'
    spotify = gets.chomp.downcase == 'y'
    puts 'Select a genre from the following list by number (not id)'
    @genres.each_with_index { |genre, index| puts "[#{index}] #{genre.name}" }
    index = gets.chomp.to_i
    @genres[index].add_item(MusicAlbum.new(Random.rand(1..10_000), archived, publish_date, spotify))
    puts 'Music album created successfully'
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
