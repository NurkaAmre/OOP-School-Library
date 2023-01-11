require 'json'

module Data
  def save_book(book)
    File.write('./database/books.json', JSON.pretty_generate(book))
  end

  def load_books
    if File.exist?('./database/books.json')
      listbooks = File.open('./database/books.json')
      info = listbooks.read
      JSON.parse(info)
    else
      File.write('./database/books.json', [])
    end
  end

  def save_person(person)
    File.write('./database/person.json', JSON.pretty_generate(person))
  end

  def load_people
    if File.exist?('./database/person.json')
      listpeole = File.open('./database/person.json')
      info = listpeole.read
      JSON.parse(info)
    else
      File.write('./database/person.json' [])
    end
  end

  def save_rental(rentals)
    File.write('./database/rentals.json', JSON.pretty_generate(rentals))
  end

  def load_rentals
    if File.exist?('./database/rentals.json')
      listrentals = File.open('./database/rentals.json')
      info = listrentals.read
      JSON.parse(info)
    else
      File.write('./database/rentals.json', [])
    end
  end
end
