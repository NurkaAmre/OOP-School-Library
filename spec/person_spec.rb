require_relative '../person'
require_relative '../rental'
require_relative '../decorator'
require_relative '../nameable'

describe Person do
  let(:person) { Person.new(18, 'John Smith', parent_permission: true) }

  describe '#initialize' do
    it 'should set the name and age' do
      expect(person.name).to eq('John Smith')
      expect(person.age).to eq(18)
    end

    it 'should set parent_permission and initialize an empty rentals array' do
      expect(person.parent_permission).to eq(true)
      expect(person.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'should return true if person is of age or has parent permission' do
      expect(person.can_use_services?).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'should return the correct_name' do
      expect(person.correct_name).to eq('John Smith')
    end
  end

  describe '#add_rentals' do
    it 'should add a new rental to the rentals array and set the person' do
      rental = double('Rental')
      allow(rental).to receive(:person=)
      person.add_rentals(rental)
      expect(person.rentals.size).to eq(1)
      expect(rental).to have_received(:person=).with(person)
    end
  end
end
