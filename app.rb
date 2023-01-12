require './person'
require './book'
require './rental'
require './student'
require './teacher'
require 'colorize'
require 'pry'
require 'json'
require './data'

class App
  include Data
  def initialize
    @rentals = load_rentals
    @books = load_books
    @persons = load_people
  end

  def list_all_books
    @books = load_books
    if @books.empty?
      puts 'There are no books listed, please enter a book name and author'.red
    else
      @books.each_with_index do |book, index|
        puts "(#{index}) Title: #{book['title']} || Author: #{book['author']}".red
      end
    end
  end

  def list_all_persons
    @persons = load_people
    if @persons.empty?
      puts 'There are no persons listed'
    else
      @persons.each_with_index do |person, index|
        puts "#{index}) Name: #{person['name']}, ID: #{person['id']} Age: #{person['age']}".green
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    creation = gets.chomp
    case creation
    when '1'
      print 'Age: '
      stu_age = gets.chomp.to_i
      print 'Name: '
      stu_name = gets.chomp
      print 'Has parents permission [Y/N]: '
      permission = gets.chomp.downcase
      parent_permission = permission == 'y'
      add_student = Student.new(stu_name, stu_age, parent_permission: parent_permission)
      @persons << {
        id: add_student.id,
        type: add_student.class,
        name: add_student.name,
        age: add_student.age
      }
      save_person(@persons)
    when '2'
      print 'Age: '
      teacher_age = gets.chomp
      print 'Name: '
      teacher_name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      add_teacher = Teacher.new(teacher_age, teacher_name, specialization)
      @persons << {
        id: add_teacher.id,
        type: add_teacher.class,
        name: add_teacher.name,
        age: add_teacher.age,
        # rentals: add_teacher.rentals,
        # specialization: add_teacher.specialization

      }
      save_person(@persons)
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
    add_book = Book.new(title, author)
    @books << { title: add_book.title, author: add_book.author }
    puts 'Book created successfully'.green
    save_book(@books)
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
    book = Book.new(@books[book_number]['title'], @books[book_number]['author'])
    person = Person.new(@persons[person_number]['name'], @persons[person_number]['id'])
    add_rental = Rental.new(date, book, person)
    arr = []
    @rentals << {
      date: add_rental.date,
      person_id: add_rental.person.id,
      person_name: add_rental.person.name,
      title: add_rental.book.title,
      author: add_rental.book.author,
      rentals: arr << add_rental.person.rentals
    }
    puts 'Rental created successfully'.yellow
    save_rental(@rentals)
  end

  def list_rentals_for_id
    @rentals = load_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i

    @rentals.select do |rental|
      next unless person_id == rental['person_id']

      print "Date: #{rental['date']}, Book: #{rental['title']} "
      print 'by '
      puts "#{rental['author']} rented by #{rental['person_name']} "
    end
  end
end
