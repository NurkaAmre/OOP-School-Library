require_relative './book'
require_relative './person'
require 'rspec'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }

  describe '#initialize' do
    it 'should set the title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'should initialize an empty rentals array' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'should add a new rental to the rentals array' do
      book.add_rental('01/01/2022', 'John Smith')
      expect(book.rentals.size).to eq(1)
      expect(book.rentals.first.date).to eq('01/01/2022')
      expect(book.rentals.first.book).to eq(book)
      expect(book.rentals.first.person).to eq('John Smith')
    end
  end
end
