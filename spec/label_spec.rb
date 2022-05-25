require_relative '../src/book'
require_relative '../src/label'
require 'json'

RSpec.describe Label do
  before :each do
    @label = Label.new(2,'Science Fictions','Red')
  end

  it 'Create an instance of Label' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'Add items to labels' do
    book1 = Book.new('2013/03/12',true,'richard','rocky',4846)
    @label.add_items(book1)
    json = JSON.generate(@label)
    expect(json).to be == '{"json_class":"Label","data":[2,"Science Fictions","Red"],'         \
                            '"items":[[{"json_class":"Book","data":'\
                            '["2013/03/12",true,"richard","rocky",4846]}]]}'
  end

  it 'Create empty label from JSON' do
    label = Label.new(1,'Algorithms','Green')
    json = JSON.generate(label)
    expect(json).to be == '{"json_class":"Label","data":[1,"Algorithms","Green"],"items":[[]]}'
    label = JSON.parse(json, create_additions: true)
    items = label.items
    expect(items.length).to be == 0
  end
end
