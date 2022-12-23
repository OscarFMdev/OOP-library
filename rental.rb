require './book'
require './person'
class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
    @person = person
    person.rentals.push(self) unless book.rentals.include?(self)
    @date = date
  end
end
