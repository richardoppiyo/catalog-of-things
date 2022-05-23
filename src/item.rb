class Item
  def initialize(id, archived, publish_date)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived
  end

  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_label(label)
    @label = label
  end

  private

  def can_be_archived
    # yyyy/mm/dd
    publish_year = @publish_date.split('/')
    current_year = Date.today.year
    (current_year - publish_year) > 10
  end
end
