require_relative '../src/genre'
require_relative '../src/music_album'
require 'json'

RSpec.describe Genre do
  before :each do
    @genre = Genre.new(1, 'Classic')
  end

  it 'Create an instance of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'Add items to genre' do
    item1 = MusicAlbum.new(1, false, '2022/05/23', false)
    item2 = MusicAlbum.new(2, false, '2022/05/23', false)
    @genre.add_item(item1)
    @genre.add_item(item2)
    json = JSON.generate(@genre)
    expect(json).to be == '{"json_class":"Genre","data":[1,"Classic"],'         \
                          '"items":[[{"json_class":"MusicAlbum","data":[1,false,"2022/05/23",false]},'\
                          '{"json_class":"MusicAlbum","data":[2,false,"2022/05/23",false]}]]}'
  end

  it 'Create items from JSON' do
    json = '{"json_class":"Genre","data":[1,"Classic"],'         \
           '"items":[[{"json_class":"MusicAlbum","data":[1,false,"2022/05/23",false]},'\
           '{"json_class":"MusicAlbum","data":[2,false,"2022/05/23",false]}]]}'
    new_genre = JSON.parse(json, create_additions: true)
    items = new_genre.items
    expect(items.length).to be == 2
    expect(items[0].genre.name).to be == 'Classic'
  end

  it 'Create empty genre from JSON' do
    genre = Genre.new(2, 'Rock')
    json = JSON.generate(genre)
    expect(json).to be == '{"json_class":"Genre","data":[2,"Rock"],"items":[[]]}'
    genre = JSON.parse(json, create_additions: true)
    items = genre.items
    expect(items.length).to be == 0
  end
end
