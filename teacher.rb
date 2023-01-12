require './person'

class Teacher < Person
  def initialize(name, age, specialization, parents_permission: true)
    @specialization = specialization
    super(name, age, parents_permission: parents_permission)
  end

  def can_use_services?
    true
  end
end
