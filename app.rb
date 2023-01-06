require './person'
require './book'
require './rental'
require './student'
require './teacher'
require 'colorize'

class App
  def initialize
    @rentals = []
    @books = []
    @persons = []
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books listed, please enter a book name and author'.red
    else
      @books.each_with_index do |book, index|
        puts "(#{index}) Title: #{book.title} || Author: #{book.author}"
      end
    end
  end

  def list_all_persons
    if @persons.empty?
      puts 'There are no persons listed'
    else
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}".green
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    creation = gets.chomp
    case creation
    when '1'
      print 'Age: '
      stu_age = gets.chomp
      print 'Name: '
      stu_name = gets.chomp
      print 'Has parents permission [Y/N]: '
      permission = gets.chomp.downcase
      parent_permission = permission == 'y'
      @persons.push(Student.new(stu_name, stu_age, parent_permission))
    when '2'
      print 'Age: '
      teacher_age = gets.chomp
      print 'Name: '
      teacher_name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @persons.push(Teacher.new(teacher_age, teacher_name, specialization))
    end
    puts 'Person created successfully'.green
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp
    puts

    print 'Enter author name: '
    author = gets.chomp
    puts

    @books.push(Book.new(title, author))
    puts 'Book created successfully'.green
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_number = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    list_all_persons
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_number], @persons[person_number]))

    puts 'Rental created successfully'.yellow
  end

  def list_rentals_for_id
    puts 'ID of person: '
    person_id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.to_i == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author} rented by #{rental.person.name}"
      else
        puts 'Nothing matches'.red
      end
    end
  end
end
