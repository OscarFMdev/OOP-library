
  # Define the Person class
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class App
  # Create an empty list of people
  people = []

  # Display the main menu
  def display_menu
    puts "Welcome to the People Manager!"
    puts "1. Add a person"
    puts "2. View the list of people"
    puts "3. Quit"
  end

  # Loop until the user selects the "Quit" option
  def selection
    loop do
      display_menu()
      print "Enter your choice: "
      choice = gets.chomp

      case choice
      when "1"
        # Add a person to the list
        print "Enter the name of the person: "
        name = gets.chomp
        print "Enter the age of the person: "
        age = gets.chomp
        person = Person.new(name, age)
        people << person
        puts "Person added successfully!"
      when "2"
        # View the list of people
        puts "Here is the list of people:"
        people.each do |person|
          puts "#{person.name}, #{person.age} years old"
        end
      when "3"
        # Quit the program
        puts "Goodbye!"
        exit
      else
        puts "Invalid selection. Please try again."
      end
    end
  end
end