require './person.rb'
# Student class
class Student < Person
  def initialize(classroom = 'Unknown')
    super(10)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
  attr_reader :id, :name, :age, :classroom
end
student1 = Student.new('A')

puts student1.age # 10
puts student1.classroom # A

puts student1.play_hooky
