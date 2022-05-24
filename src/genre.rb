require_relative './item'

class Genre
  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end
  attr_reader :name
  attr_accessor :items

  def add_item(item)
    @items.push item
    item.add_genre(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @name],
      'items' => [@items]
    }.to_json(*args)
  end

  def self.json_create(object)
    genre = new(*object['data'])
    genre.items = object['items'][0]
    genre.update_associations
    genre
  end

  def update_associations
    @items.each { |item| item.add_genre(self) }
  end
end
