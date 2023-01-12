require 'rspec'
require_relative 'teacher'
require_relative 'person'

describe Teacher do
  let(:teacher) { Teacher.new('Jane Doe', 30, 'English', parent_permission: true) }

  describe '#initialize' do
    it 'should set the name, age, specialization and parent_permission' do
      expect(teacher.name).to eq('Jane Doe')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('English')
      expect(teacher.parent_permission).to eq(true)
    end
  end

  describe '#can_use_services?' do
    it 'should return true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
