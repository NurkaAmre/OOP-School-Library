require_relative './book'
require_relative './person'

book = Book.new('Quran', 'Allah')
person = Person.new(4, 'Amre', true)

describe Book do
    context 'When creating new book' do
        it 'should have title and author attributes' do
            expect(book.title).to eql 'Quran'
            expect(book.author).to eql 'Allah'
        end
    end

    context 'When creating new book' do
        it 'should have age, name, boolean attributes' do
            expect(person.age).to eql 4
            expect(person.name).to eql 'Amre'
            expect(person.parent_permission).to eql true
        end
    end
end