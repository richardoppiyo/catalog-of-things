class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = rand(1000)
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
end
