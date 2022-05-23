require_relative './src/app'
require_relative './src/menu'
require_relative './src/run'
def main
  app = App.new
  print_hello
  loop do
    print_message
    selection = gets.chomp
    puts 'Thank you for using this app!' if selection == '10'
    break if selection == '10'

    run(selection, app)
  end
end

main
