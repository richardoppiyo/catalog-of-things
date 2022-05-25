require_relative './item'

class Author
  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
  attr_reader :first_name, :last_name
  attr_accessor :items

  def add_item(item)
    @items.push item
    item.add_author(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @first_name, @last_name],
      'items' => [@items]
    }.to_json(*args)
  end

  def self.json_create(object)
    author = new(*object['data'])
    author.items = object['items'][0]
    author.update_associations
    author
  end

  def update_associations
    @items.each { |item| item.add_author(self) }
  end
end
