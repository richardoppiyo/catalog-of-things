require_relative './book'
require_relative './label'
require_relative './input'

class App
  include Input

  def initialize
    @books = []
    @label = []
    if File.exist?('./books.json')
      @label = JSON.parse(File.read('./books.json'), create_additions: true)
    else
      load_default_labels
    end
  end

  def load_default_labels
    @label.push(Label.new(1, 'Algorithms', 'Green'))
    @label.push(Label.new(2, 'Science Fictions', 'Red'))
    @label.push(Label.new(1, 'Classicals', 'Blue'))
    @label.push(Label.new(2, 'Educational', 'White'))
    @label.push(Label.new(1, 'Geographical', 'Purple'))
    @label.push(Label.new(2, 'General Knowlege', 'Orange'))
  end

  def save_data
    File.write('./books.json', JSON.generate(@label))
  end

  def list_all_books
    puts 'Sorry, there are no books in the books list' if @label.empty?
    @label.each do |book|
      puts book.items
    end
  end

  def list_all_music_albums
    puts 'List of music albums'
  end

  def list_of_games
    puts 'List of games'
  end

  def list_all_genres
    puts 'List of genres'
  end

  def list_all_labels
    puts 'Sorry, there are no labels in the label list' if @label.empty?
    @label.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end

  def list_all_authors
    puts 'List of authors'
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

    @label[index].add_items(Book.new(publish_date, archived, publisher, cover_state, Random.rand(1..10_000)))
    puts 'Book created succesfully!'
  end

  def add_music_album
    puts 'Add music album'
  end

  def add_game
    puts 'Add game'
  end
end
