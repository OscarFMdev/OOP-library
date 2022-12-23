require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'book'
require 'colorize'

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
      puts ""
      print "Please choose an option by entering a number: "
      display_menu
      choice = gets.chomp
      action = OPTIONS[choice]

      if action == :quit
        puts "Thank you for using this app!"
        break
      elsif action
        send(action)
      else
        puts "INVALID OPTION, please, try again".colorize(:red)
      end # if_condition
    end # loop
  end # selection

  def list_books
    if @books == []
      puts "\nNo books added, please, add some books \n".colorize(:red)
    end
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}".colorize(:green)
    end
  end

  def list_people
    if @people == []
      puts "\nNo people added, please, add some people \n".colorize(:red)
    end
    @people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".colorize(:green)
    end
  end

  def create_person
    print "Do you want to create a student #{'(1)'.colorize(:green)} or a teacher #{'(2)'.colorize(:yellow)}? [Input the number]: "
    option_person = gets.chomp.to_i
    case option_person
    when 1
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Has parent permission? [Y/N]: '
      person_permission = gets.chomp.to_s
      if person_permission.capitalize == 'N'
        @people.push(Student.new(person_age, name: person_name, parent_permission: false))
      else
        @people.push(Student.new(person_age, name: person_name))
      end
      puts 'Person created successfully'.colorize(:green)
    when 2
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Specialization: '
      person_specialization = gets.chomp.to_s
      @people.push(Teacher.new(person_age, person_specialization, name: person_name))
      puts 'Person created successfully'.colorize(:green)
    else
      puts 'Error: Invalid number, try again'.colorize(:red)
      send(:create_person)
    end
  end # create_person

  def create_book
    print 'Title: '
    book_title = gets.chomp.to_s
    print 'Author: '
    book_author = gets.chomp.to_s
    @books.push(Book.new(book_title, book_author))
    puts 'Book created successfully'.colorize(:green)
  end

  

end # App


#      case choice
# when "1"
#   # Add a person to the list
#   print "Enter the name of the person: "
#   name = gets.chomp
#   print "Enter the age of the person: "
#   age = gets.chomp
#   person = Person.new(name, age)
#   people << person
#   puts "Person added successfully!"
# when "2"
#   # View the list of people
#   puts "Here is the list of people:"
#   people.each do |person|
#     puts "#{person.name}, #{person.age} years old"
#   end
# when "3"
#   # Quit the program
#   puts "Goodbye!"
#   exit
# else
#   puts "Invalid selection. Please try again."
# end