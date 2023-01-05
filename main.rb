require_relative './person'
require_relative './classroom'
require_relative './student'

OPTIONS = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rental,
    '7' => :quit
}.freeze

system('cls')
person = Person.new(22, 'maximilianus')	
p person.correct_name	
capitalized_person = CapitalizeDecorator.new(person)	
p capitalized_person.correct_name	
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)	
p capitalized_trimmed_person.correct_name

student = Student.new('A1', 13 , 'Unknown', parent_permission: false)
puts student

