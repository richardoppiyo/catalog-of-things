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
    @label.push(Label.new(1, 'Classic', 'green'))
    @label.push(Label.new(2, 'Rock', 'black'))
  end

  def save_data
    File.write('./books.json', JSON.generate(@labels)) 
    # unless @labels.empty?
  end

  def list_all_books
    # puts "Sorry, there are no books in the books list" if @label.empty?
    @label.each do |book|
      puts book.items 
      # puts "publisher : #{book.title}"
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
    puts "Sorry, there are no labels in the label list" if @books.empty?
    @labels.each do |label|
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

    @books.push(Book.new(publish_date, archived, publisher, cover_state, Random.rand(1..10_000)))
    puts 'Book created succesfully!'
  end

  def add_music_album
    puts 'Add music album'
  end

  def add_game
    puts 'Add game'
  end
end
