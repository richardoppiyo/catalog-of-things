require_relative './item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, archived, publish_date, publisher, cover_state)
    super(id, archived, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @archived, @publish_date, @publisher, @cover_state]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  def to_s
    "Id:#{@id} Published date: #{@publish_date} "\
      "publisher: #{@publisher} "\
      "cover_state: #{@cover_state}  Archived: #{@archived}"
  end

  def can_be_archived
    return true if super == true || @cover_state == 'bad'

    false
  end
end
