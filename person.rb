require './nameable'
require './trimmer'
require './capitalize'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, book, self)
  end

  private

  def of_age?
    return true if @age >= 18
  end
end
