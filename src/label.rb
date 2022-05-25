require_relative './item'

class Label
  attr_accessor :items, :color, :title

  def initialize(title, color, id)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    @items.push(item)
    item.add_label(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @title, @color],
      'items' => [@items]
    }.to_json(*args)
  end

  def self.json_create(object)
    label = new(*object['data'])
    label.items = object['items'][0]
    label.update_associations
    label
  end

  def update_associations
    @items.each { |item| item.add_label(self) }
  end
end
