require './rental'
require './student'
require './book'

describe Rental do
  context 'When testing the rental.rb' do
    before :each do
      student = Student.new('wizard', 20, true)
      book = Book.new('Gone in seconds', 'Shuhad')
      @rental = Rental.new('20230105', book, student)
    end
    it 'The person should have rental added' do
      expect(@rental).to be_an_instance_of Rental
    end
  end
end
