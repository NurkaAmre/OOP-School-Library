require './student'
require './classroom'

math = Classroom.new('Math')

describe Student do
  context 'When testing the Student class' do
    it 'The modify_classroom method should modify the current student to classroom' do
      student = Student.new(22, 'Shuhad', true)
      student.add_classroom(math)
      expect(student.classroom).to eq math
    end
  end
end