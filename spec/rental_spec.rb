require_relative './rental'
require_relative './person'
require_relative './book'

describe Rental do
  let(:book) { double('Book', rentals: []) }
  let(:person) { double('Person', rentals: []) }
  let(:rental) { Rental.new('01/01/2022', book, person) }

  describe '#initialize' do
    it 'should set the date, book, and person' do
      expect(rental.date).to eq('01/01/2022')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it "should add the rental to the book and person's rental array" do
      expect(book).to have_received(:[]=).with('rentals', rental)
      expect(person).to have_received(:[]=).with('rentals', rental)
    end
  end
end
