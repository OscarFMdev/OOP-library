require './person'

# Teacher class
class Teacher < Person
  def initialize(specialization, age, name = 'Unkown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  attr_accessor :specialization, :age
end

teacher1 = Teacher.new('Math', 25)

puts teacher1.age # 25
puts teacher1.specialization # 'Math'
