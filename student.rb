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
student1 = Student.new('A', 10, 'Alfred')

puts student1.age # 10
# puts student1.classroom # A
puts student1.play_hooky # ¯\(ツ)/¯

puts student1.classroom

classroom1 = Classroom.new('A')

puts classroom1.add_student(student1)
