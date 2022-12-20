# frozen_string_literal: true

require './person'

# Teacher class
class Teacher < Person
  def initialize(specialization, age, name = 'Unkown')
    super(age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  attr_accessor :specialization, :age
end

teacher1 = Teacher.new('Math')

puts teacher1.age # Random age between 20 and 40 (if not given)
puts teacher1.specialization # 'Math'
