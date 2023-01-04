require './nameable'
require './trimmer'
require './capitalize'
require './rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  private

  def of_age?
    return true if @age >= 18
  end
end
