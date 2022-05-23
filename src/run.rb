def run(selection, app)
  if %w[1 2 3 4 5 6].include?(selection) then list_options(selection, app)
  else
    case selection
    when '7' then app.add_book
    when '8' then app.add_music_album
    when '9' then app.add_game
    else puts 'Wrong value. Try again'
    end
  end
end

def list_options(selection, app)
  case selection
  when '1' then app.list_all_books
  when '2' then app.list_all_music_albums
  when '3' then app.list_of_games
  when '4' then app.list_all_genres
  when '5' then app.list_all_labels
  when '6' then app.list_all_authors
  end
end
