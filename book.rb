require './rental'
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date)
    @rentals.push(date, @title, @author)
  end
end
