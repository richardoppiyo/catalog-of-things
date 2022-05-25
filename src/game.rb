require_relative './item'
require 'json'

class Game < Item
  def initialize(id, archived, publish_date, multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(id, archived, publish_date)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@id, @archived, @publish_date, @multiplayer, @last_played_at]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  def to_s
    "Id:#{@id} Published date: #{@publish_date} " \
      "Multiplayer: #{@multiplayer} Last played at: #{@last_played_at} " \
      "Archived: #{@archived}"
  end

  private

  def can_be_archived
    current_year = Date.today.year
    last_played_at_year = Date.parse(@last_played_at).year

    super() && current_year - last_played_at_year > 2
  end
end
