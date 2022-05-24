require_relative './item'
require 'json'

class MusicAlbum < Item
  def initialize(id, archived, publish_date, on_spotify)
    @on_spotify = on_spotify
    super(id, archived, publish_date)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @archived, @publish_date, @on_spotify]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  private

  def can_be_archived
    (@on_spotify && super)
  end
end
