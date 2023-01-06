class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def book=(book)
    @book = book
    @book.rentals << self unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    @person.rentals << self unless person.rentals.include?(self)
  end
end
