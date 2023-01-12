require_relative './student'
require_relative './classroom'
require_relative './person'

describe Student do
  let(:classroom) { double('Classroom', students: []) }
  let(:student) { Student.new(18, 'John Smith', classroom, parent_permission: true) }

  describe '#initialize' do
    it 'should set the name, age, classroom, and parent_permission' do
      expect(student.name).to eq('John Smith')
      expect(student.age).to eq(18)
      expect(student.classroom).to eq(classroom)
      expect(student.parent_permission).to eq(true)
    end
  end

  describe '#add_classroom' do
    it "should set the classroom and add the student to the classroom's students array" do
      new_classroom = double('Classroom', students: [])
      student.add_classroom(new_classroom)
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it "should return the '¯(ツ)/¯' string" do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
