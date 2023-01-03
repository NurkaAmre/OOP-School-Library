require_relative './person'
class Student < Person
  def initialize(id, classroom, age, name: 'Unknown', parent_permission: true)
    @classroom = classroom
    super(id, name, age, parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
