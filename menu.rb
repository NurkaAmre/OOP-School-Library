require './app'
require 'colorize'

def menu
  puts 'Welcome to my app'.magenta
  puts 'Choose an option by entering a number: '.cyan
  puts '1) List all books'.green
  puts '2) List all people'.green
  puts '3) Create a person'.green
  puts '4) Create a book'.green
  puts '5) Create a rental'.green
  puts '6) List all rentals for a given person id'.green
  puts '7) Exit'.green
end
