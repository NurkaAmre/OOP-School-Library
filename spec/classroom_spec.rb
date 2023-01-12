require 'rspec'
require_relative 'classroom'
require_relative 'student'

describe Classroom do
  let(:classroom) { Classroom.new('Room 101') }
  let(:student) { double('student') }

  describe '#initialize' do
    it 'sets the label' do
      expect(classroom.label).to eq('Room 101')
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds the student to the students array' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom on the student' do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
    end
  end
end
