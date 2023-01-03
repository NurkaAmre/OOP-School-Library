class Person
  attr_accessor :id, :name, :age

  def initilialize(id, age, name: 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  private

  def of_age?
    return true if @age >= 18
  end
end
