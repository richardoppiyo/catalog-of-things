require_relative './book'
require_relative './label'
require_relative './input'
require_relative './item'
require_relative './genre'
require_relative './music_album'
require_relative './author'
require_relative './game'
require 'json'

class App
  include Input

  def initialize
    load_genres_and_albums
    load_authors_and_games
    load_books_and_labels
  end

  def load_books_and_labels
    @label = []
    if File.exist?('./books.json')
      @label = JSON.parse(File.read('./books.json'), create_additions: true)
    else
      load_default_labels
    end
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

  def load_default_labels
    @label.push(Label.new(1, 'Algorithms', 'Green'))
    @label.push(Label.new(2, 'Science Fictions', 'Red'))
    @label.push(Label.new(3, 'Classicals', 'Blue'))
    @label.push(Label.new(4, 'Educational', 'White'))
    @label.push(Label.new(5, 'Geographical', 'Purple'))
    @label.push(Label.new(6, 'General Knowlege', 'Orange'))
  end

  def save_data
    File.write('./books.json', JSON.generate(@label))
    File.write('./games.json', JSON.generate(@authors))
    File.write('./music_albums.json', JSON.generate(@genres))
  end

  def list_all_books
    puts 'Sorry, there are no books in the books list' if @label.empty?
    @label.each do |book|
      puts book.items
    end
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
    puts 'Sorry, there are no labels in the label list' if @label.empty?
    @label.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end

  def list_all_authors
    puts 'List of authors'
    @authors.each do |author|
      puts "Author: #{author.first_name}"
    end
  end

  def add_book
    puts 'Please enter the publisher name?'
    publisher = gets.chomp
    puts 'Please enter the cover state of the book?'
    cover_state = gets.chomp
    archived = y_n { 'is it archived?:[Y or N]' }
    puts 'Please enter publish date?'
    publish_date = gets.chomp
    puts 'Select a label for the book from the following list (not id)'
    @label.each_with_index { |label, index| puts "[#{index}] #{label.title}" }
    index = gets.chomp.to_i
    @label[index].add_items(Book.new(Random.rand(1..10_000), archived, publish_date, publisher, cover_state))
    puts 'Book created succesfully!'
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
