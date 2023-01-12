require './classroom'
require './student'

student = Student.new(200, 'wizard', false)

describe Classroom do
  context 'When testing the classroom class' do
    it 'The student attr should be of length zero' do
      classroom = Classroom.new('Math')
      expect(classroom.students.length).to eq 0
    end

    it 'When adding a student to a classroom students length should grow' do
      classroom = Classroom.new('English')
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end