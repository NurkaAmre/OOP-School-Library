require './book'
require './person'

describe Book do
  context 'Given an instance of a book' do
    before :each do
      @book = Book.new('A Tale of Two Cities', 'Charles Dickens')
    end

    it 'returns a new book' do
      expect(@book).to be_instance_of Book
    end

    it 'check correct author' do
      @book.author = 'Robert Stevenson'
      expect(@book.author).to eql 'Robert Stevenson'
    end

    it 'check correct title' do
      @book.title = 'Treasure Island'
      expect(@book.title).to eql 'Treasure Island'
    end
  end
end