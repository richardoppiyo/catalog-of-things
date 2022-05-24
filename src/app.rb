require_relative './item'
require_relative './genre'
require_relative './music_album'
require_relative './author'
require_relative './game'
require 'json'

class App
  def initialize
    load_genres_and_albums
    load_authors_and_games
  end

  def load_genres_and_albums
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

  def load_authors_and_games
    @authors = []
    if File.exist?('./games.json')
      @authors = JSON.parse(File.read('./games.json'), create_additions: true)
    else
      load_default_author
    end
  end

  def load_default_author
    @authors.push(Author.new(1, 'John', 'Doe'))
    @authors.push(Author.new(2, 'Jane', 'Doe'))
  end

  def save_data
    File.write('./games.json', JSON.generate(@authors))
    File.write('./music_albums.json', JSON.generate(@genres))
  end

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
    puts 'List of games'
    @authors.each do |author|
      puts author.items
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
    puts 'List of authors'
    @authors.each do |author|
      puts "Author: #{author.first_name}"
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
    puts 'Add game'
    puts "\nPlease enter publish date (yyyy/mm/dd):"
    publish_date = gets.chomp
    puts 'Archived item (y/n)'
    archived = gets.chomp.downcase == 'y'
    puts 'It is multiplayer? (y/n)'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'when it was last played? (yyyy/mm/dd)'
    last_played = gets.chomp
    puts 'Select an author from the following list by number (not id)'
    @authors.each_with_index { |author, index| puts "[#{index}] #{author.first_name} #{author.last_name}" }
    index = gets.chomp.to_i
    @authors[index].add_item(Game.new(Random.rand(1..10_000), archived, publish_date, multiplayer, last_played))
    puts 'Game created successfully'
  end
end
