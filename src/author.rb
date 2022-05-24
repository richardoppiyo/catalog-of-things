class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(id, first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @first_name, @last_name]
      'items' => [@items]
    }.to_json(*args)
  end

def self.json_create(object)
  author = new(*object['data'])
  author.items = object['items'][0]
  author
end
end
