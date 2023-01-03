require './nameable'

class Person < Nameable
  attr_accessor :id, :name, :age

  def initialize(id, age, name: 'Unknown', parent_permission: 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    super
  end

  def can_use_services?
    return true if of_age? || @parent_permission == true
  end

  private

  def of_age?
    return true if @age >= 18
  end
end
