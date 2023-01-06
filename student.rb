require_relative './person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom, parent_permission: true)
    @classroom = classroom
    super(name, age, parent_permission: parent_permission)
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
