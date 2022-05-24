require_relative './src/app'
require_relative './src/menu'
require_relative './src/run'
def main
  app = App.new
  print_hello
  loop do
    print_message
    selection = gets.chomp
    if selection == '10'
      puts 'Thank you for using this app!'
      app.save_data
    end
    break if selection == '10'

    run(selection, app)
  end
end

main