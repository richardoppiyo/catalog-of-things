require_relative '../src/author'
require_relative '../src/game'
require 'json'

RSpec.describe Author do
  before :each do
    @author = Author.new(1, 'John', 'Doe')
  end

  it 'Create an instance of Author' do
    expect(@author).to be_an_instance_of(Author)
  end

  it 'Add items to author' do
    item1 = Game.new(1, false, '2021/07/26', true, '2021/07/03')
    item2 = Game.new(2, false, '1993/07/26', true, '1999/07/03')
    @author.add_item(item1)
    @author.add_item(item2)
    json = JSON.generate(@author)
    expect(json).to be == '{"json_class":"Author","data":[1,"John","Doe"],'         \
                          '"items":[[{"json_class":"Game","data":[1,false,"2021/07/26",true,"2021/07/03"]},'\
                          '{"json_class":"Game","data":[2,false,"1993/07/26",true,"1999/07/03"]}]]}'
  end

  it 'Create items from JSON' do
    json = '{"json_class":"Author","data":[1,"John", "Doe"],'         \
           '"items":[[{"json_class":"Game","data":[1,false,"2021/07/26",true,"2021/07/03"]},'\
           '{"json_class":"Game","data":[2,false,"1993/07/26",true,"1999/07/03"]}]]}'
    new_author = JSON.parse(json, create_additions: true)
    items = new_author.items
    expect(items.length).to be == 2
    expect(items[0].author.first_name).to be == 'John'
  end

  it 'Create empty author from JSON' do
    author = Author.new(2, 'Jane', 'Doe')
    json = JSON.generate(author)
    expect(json).to be == '{"json_class":"Author","data":[2,"Jane","Doe"],"items":[[]]}'
    author = JSON.parse(json, create_additions: true)
    items = author.items
    expect(items.length).to be == 0
  end
end
