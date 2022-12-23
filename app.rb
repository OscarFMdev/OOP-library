require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'book'

OPTIONS = {
  '1' => :list_books,
  '2' => :list_people,
  '3' => :create_person,
  '4' => :create_book,
  '5' => :create_rental,
  '6' => :list_rentals,
  '7' => :quit
}.freeze
  # Define the Person class

class App
  # Create an empty list of people
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # Display the main menu
  def display_menu
    puts ''
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # Loop until the user selects the "Quit" option
  def selection
    loop do
      print "Please choose an option by entering a number: "
      display_menu
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