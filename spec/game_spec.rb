require_relative '../src/game'
require_relative '../src/author'
require 'json'

RSpec.describe Game do
  before :each do
    @game = Game.new(1, false, '2021/07/26', true, '2021/07/03')
  end
  it 'Create an instance of Game' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'Be kind of Item' do
    expect(@game).to be_kind_of(Item)
  end

  it 'Add Author to game' do
    author = Author.new(1, 'John', 'Doe')
    author.add_item(@game)
    expect(@game.author.first_name).to be == 'John'
  end

  it 'Create JSON string' do
    author = Author.new(1, 'John', 'Doe')
    author.add_item(@game)
    json = JSON.generate(@game)
    expect(json).to be == '{"json_class":"Game","data":[1,false,"2021/07/26",true,"2021/07/03"]}'
  end

  it 'Create instance from JSON string' do
    json = '{"json_class":"Game","data":[1,false,"2021/07/26",true,"2021/07/03"]}'
    new_game = JSON.parse(json, create_additions: true)
    expect(new_game).to be_an_instance_of(Game)
  end
end
