require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'
# Person class
class Person < Nameable
  attr_reader :id, :date
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_person_rental(date)
    @rentals.push(date)
  end

  private

  def of_age?
    @age >= 18
  end
end