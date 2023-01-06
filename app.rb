require './student'
require './teacher'
require './book'
require './rental'

OPTIONS = {
  '1' => :list_books,
  '2' => :list_people,
  '3' => :create_person,
  '4' => :create_book,
  '5' => :create_rental,
  '6' => :list_rental,
  '7' => :quit
}.freeze

class Main
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def menu_display
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def choose_select
    loop do
      puts ''
      print 'Choose the options pls: '
      menu_display
      choice = gets.chomp
      promp = OPTIONS[choice]

      if promp == :quit
        puts 'Bye'
        break
      elsif promp
        send(promp)
      else
        puts 'Invalid eyob digitin balasy, try again'
      end
    end
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    def create_person
      puts 'Do you want to create student (press 1) or teacher (press2)?'
      choice = gets.chomp.to_i
      case choice
      when 1
        add_student
      when 2
        add_teacher
      else
        puts 'Invalid number eob digidiktin balasi try again'
        create_person
      end
    end

    def add_student
      print 'Age: '
      age = gets.chomp.to_i

      print 'Name: '
      name = gets.chomp.to_s

      print 'Are you have 18? [Y/N]: '
      permission = gets.chomp
      if person_permission.capitalize == 'N'
        @people.push(Student.new(person_age, name: person_name, parent_permission: false))
      else
        @people.push(Student.new(person_age, name: person_name))
      end
      puts %(Student "#{name}" who is "#{age}" years old registered to our library!)
    end

    def add_teacher
      print 'Age: '
      age = gets.chomp.to_i

      print 'Name: '
      name = gets.chomp.to_s

      print 'Specialization: '
      person_specialization = gets.chomp.to_s
      @people.push(Teacher.new(person_age, person_specialization, name: person_name))
      puts "Angry teacher named '#{name}' aged '#{age}' special at '#{specialization}' was registered again!"
    end

    def create_book
      print 'Title: '
      book_title = gets.chomp.to_s
      print 'Author: '
      book_author = gets.chomp.to_s
      @books.push(Book.new(book_title, book_author))
      puts 'Congratulations, Book created successfully'
    end

    def create_rental
      puts 'Select a book from the following list by number'
      @books.each_with_index do |object, index|
        puts "#{index} Title: '#{object.title}', Author: #{object.author}"
      end
      book_number = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |object, index|
        puts "#{index} [#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
      end
      person_number = gets.chomp.to_i
      print 'Date: '
      date = gets.chomp.to_s
      @rentals.push(Rental.new(@books[book_number], @people[person_number], date))
      puts 'Rental created successfully'
    end
  end

  def list_rental
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |object|
      puts "Date: #{object.date}, Book '#{object.book.title}' by #{object.book.author}" if object.person.id == person_id
    end
  end
end
