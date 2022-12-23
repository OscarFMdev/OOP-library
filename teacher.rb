require './person'

# Teacher class
class Teacher < Person
  attr_reader :parent_permission

  def initialize(specialization, age, name = 'Unkown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

