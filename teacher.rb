require './person'

# Teacher class
class Teacher < Person
  attr_reader :parent_permission

  def initialize(specialization, age, name = 'Unkown', parent_permission: true)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new('Math', 25)

puts teacher1.age # 25
# puts teacher1.specialization # 'Math'
puts teacher1.parent_permission # True
