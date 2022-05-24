module AuthorsData
  def read_authors
    data = []
    if File.exist?('authors.json')
      JSON.parse(File.read('authors.json')).each do |author|
        data.push(Author.new(author['first_name'], author['last_name']))
      end
    else
      File.write('authors.json', [])
    end
    data
  end

  def write_authors(authors)
    data = []
    authors.each do |author|
      data.push(
        {
          'first_name' => author.first_name,
          'last_name' => author.last_name
        }
      )
    end
    File.write('authors.json', JSON.generate(data))
  end
end
