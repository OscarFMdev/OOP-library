require './person'
require './classroom'
# Student class
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name)
    super(age, name)
    @classroom = classroom
  end

  def classroom_add(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
