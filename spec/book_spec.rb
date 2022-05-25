require_relative '../src/book'
require_relative '../src/label'
require 'json'

RSpec.describe Book do
  before :each do
    @book = Book.new('2013/03/12', true, 'richard', 'rocky', 4846)
  end

  it 'Create an instance of the book object' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'To be 1 kind on the Item' do
    expect(@book).to be_kind_of(Item)
  end

  it 'Add label to a book' do
    label = Label.new(3, 'Classicals', 'Blue')
    label.add_items(@book)
    expect(@book.label.color).to be == 'Blue'
  end

  it 'creates a JSON string' do
    label = Label.new(3, 'Classicals', 'Blue')
    label.add_items(@book)
    json = JSON.generate(@book)
    expect(json).to be == '{"json_class":"Book","data":["2013/03/12",true,"richard","rocky",4846]}'
  end

  it 'creates instance from JSON string' do
    json = '{"json_class":"Book","data":["2013/03/12",true,"richard","rocky",4846]}'
    new_book = JSON.parse(json, create_additions: true)
    expect(new_book).to be_an_instance_of(Book)
  end
end
