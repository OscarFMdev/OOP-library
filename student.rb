require './person'
# Student class
class Student < Person
  def initialize(classroom, age, name)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
student1 = Student.new('A', 10, 'Alfred')

puts student1.age # 10
# puts student1.classroom # A
puts student1.play_hooky # ¯\(ツ)/¯
