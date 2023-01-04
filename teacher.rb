require_relative './person'
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(name, id, age, parent_permission)
  end

  def can_use_services?
    true
  end
end
