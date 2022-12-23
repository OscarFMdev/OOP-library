require './person'
require './classroom'
# Student class
class Student < Person
  attr_accessor :classroom

  def initialize(age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
  end

  def classroom_add(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
