require './person'

person = Person.new(45, 'Steve')

describe Person do
  context 'When testing the Person class' do
    it 'The correct_name method should return the person name' do
      expect(person.correct_name).to eq 'Steve'
    end

    it 'The can_use_services? method should return true' do
      expect(person.can_use_services?).to be true
    end
  end
end
