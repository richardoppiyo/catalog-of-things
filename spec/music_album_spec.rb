require_relative '../src/music_album'
require_relative '../src/genre'
require 'json'

RSpec.describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new(1, false, '2022/05/23', false)
  end
  it 'Create an instance of MusicAlbum' do
    expect(@music).to be_an_instance_of(MusicAlbum)
  end

  it 'Be kind of Item' do
    expect(@music).to be_kind_of(Item)
  end

  it 'Add Genre' do
    genre = Genre.new(1, 'Classic')
    genre.add_item(@music)
    expect(@music.genre.name).to be == 'Classic'
  end

  it 'Create JSON string' do
    genre = Genre.new(1, 'Classic')
    genre.add_item(@music)
    json = JSON.generate(@music)
    json_genre = JSON.generate(genre)
    puts json_genre
    expect(json).to be == '{"json_class":"MusicAlbum","data":[1,false,"2022/05/23",false]}'
  end

  it 'Create instance from JSON string' do
    json = '{"json_class":"MusicAlbum","data":[1,false,"2022/05/23",false]}'
    new_music = JSON.parse(json, create_additions: true)
    expect(new_music).to be_an_instance_of(MusicAlbum)
  end
end
