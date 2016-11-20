# ✅ All your searching and deleting methods should use enumerable instead of loop
# ✅ The application should read the existing employees from a csv file named employees.csv
# ✅ Your initial employees.csv should look like this (e.g. create this the same time you create your database.rb file) -- It is ok and expected this file will change as you add and delete employees:
#     --name,phone,address,position,salary,slack,github
#     --Gavin,555-1212,1 Main Street,Instructor,1000000,gstark,gstark
#     --Jason,555-4242,500 Elm Street,Instructor,2000000,ambethia,ambethia
#     --Toni,555-4444,200 Pine Street,Campus Director,3000000,amazing_toni,amazing_toni
# ✅ The main loop of the application should show a menu of options to the user to include at least: Add a person, Search for a person, Delete a person
# ✅ HINT: Show the list of options and allow the user to enter A for Add, S for Search and D for Delete
# ✅ Track the following information: Name, Phone number, Address, Position (e.g. Instructor, Student, TA, Campus Director) , Salary, Slack Account, Github Account
# ❌ Don't allow creating a new person if their name already exists
# ❌ When searching for a person, allow for a partial match against the person's name, or the full Slack Account or the full Github Account
# ✅ If the person is found, show all their relevant information.
# ✅ Show the information in a nice presentation.
# ✅ If a person is not found, inform the user
# ✅ When deleting a person, prompt for the name and search for an exact match. If found, delete the person, otherwise tell the user there wasn't a match.
# ✅ Every time we add or delete an employee we should rewrite the employees.csv file
# ✅ Create a new menu option that shows a report containing:
#     --Show each employee and their details (name, phone, address, position, salary, slack account, github account)

require "csv"

@people = []

class Person
  attr_accessor :name, :phone, :address, :position, :salary, :slack, :github

  def initialize (name, phone, address, position, salary, slack, github)
    @name = name
    @phone = phone
    @address = address
    @position = position
    @salary = salary
    @slack = slack
    @github = github
  end
end

# set up saving to CSV file
def save_employees
  csv = CSV.open("employees.csv", "w")
  csv.add_row ["name","phone","address","position","salary","slack","github"]
  @people.each do |person|
    csv.add_row [person.name, person.phone, person.address, person.position, person.salary, person.slack, person.github]
  end
  csv.close
end

# Open the csv file and read all the rows, creating a new person that I will put in @people
CSV.foreach("employees.csv", headers:true) do |person|
  name = person["name"]
  phone = person["phone"]
  address = person["address"]
  position = person["position"]
  salary = person["salary"]
  slack = person["slack"]
  github = person["github"]
  person = Person.new(name, phone, address, position, salary, slack, github)
  @people << person
  save_employees
end

# searches for a person by name. will select and return any person with matching searched name
def search (person_name)
  found_people = @people.select { |person| person.name == person_name }
  return found_people
end

# "data" gets a response from user and returns said response
def get_info (data)
  print "#{data} "
  gets.chomp
end

# puts "
# TTTTTTTTTTTTTTTTTTTTTTT IIIIIIIIII YYYYYYY       YYYYYYY                  DDDDDDDDDDDDD                                   tttt
# T:::::::::::::::::::::T I::::::::I Y:::::Y       Y:::::Y                  D::::::::::::DDD                             ttt:::t
# T:::::::::::::::::::::T I::::::::I Y:::::Y       Y:::::Y                  D:::::::::::::::DD                           t:::::t
# T:::::TT:::::::TT:::::T II::::::II Y::::::Y     Y::::::Y                  DDD:::::DDDDD:::::D                          t:::::t
# TTTTTT  T:::::T  TTTTTT   I::::I   YYY:::::Y   Y:::::YYY                    D:::::D    D:::::D   aaaaaaaaaaaaa   ttttttt:::::ttttttt       aaaaaaaaaaaaa
#         T:::::T           I::::I      Y:::::Y Y:::::Y                       D:::::D     D:::::D  a::::::::::::a  t:::::::::::::::::t       a::::::::::::a
#         T:::::T           I::::I       Y:::::Y:::::Y                        D:::::D     D:::::D  aaaaaaaaa:::::a t:::::::::::::::::t       aaaaaaaaa:::::a
#         T:::::T           I::::I        Y:::::::::Y      ---------------    D:::::D     D:::::D           a::::a tttttt:::::::tttttt                a::::a
#         T:::::T           I::::I         Y:::::::Y       -:::::::::::::-    D:::::D     D:::::D    aaaaaaa:::::a       t:::::t               aaaaaaa:::::a
#         T:::::T           I::::I          Y:::::Y        ---------------    D:::::D     D:::::D  aa::::::::::::a       t:::::t             aa::::::::::::a
#         T:::::T           I::::I          Y:::::Y                           D:::::D     D:::::D a::::aaaa::::::a       t:::::t            a::::aaaa::::::a
#         T:::::T           I::::I          Y:::::Y                           D:::::D    D:::::D a::::a    a:::::a       t:::::t    tttttt a::::a    a:::::a
#       TT:::::::TT       II::::::II        Y:::::Y                         DDD:::::DDDDD:::::D  a::::a    a:::::a       t::::::tttt:::::t a::::a    a:::::a
#       T:::::::::T       I::::::::I     YYYY:::::YYYY                      D:::::::::::::::DD   a:::::aaaa::::::a       tt::::::::::::::t a:::::aaaa::::::a
#       T:::::::::T       I::::::::I     Y:::::::::::Y                      D::::::::::::DDD      a::::::::::aa:::a        tt:::::::::::tt  a::::::::::aa:::a
#       TTTTTTTTTTT       IIIIIIIIII     YYYYYYYYYYYYY                      DDDDDDDDDDDDD          aaaaaaaaaa  aaaa          ttttttttttt     aaaaaaaaaa  aaaa
#
#                           BBBBBBBBBBBBBBBBB
#                           B::::::::::::::::B
#                           B::::::BBBBBB:::::B
#                           BB:::::B     B:::::B
#                             B::::B     B:::::B            aaaaaaaaaaaaa                 ssssssssss                 eeeeeeeeeeee
#                             B::::B     B:::::B            a::::::::::::a              ss::::::::::s              ee::::::::::::ee
#                             B::::BBBBBB:::::B             aaaaaaaaa:::::a           ss:::::::::::::s            e::::::eeeee:::::ee
#                             B:::::::::::::BB                       a::::a           s::::::ssss:::::s          e::::::e     e:::::e
#                             B::::BBBBBB:::::B               aaaaaaa:::::a            s:::::s  ssssss           e:::::::eeeee::::::e
#                             B::::B     B:::::B            aa::::::::::::a              s::::::s                e:::::::::::::::::e
#                             B::::B     B:::::B           a::::aaaa::::::a                 s::::::s             e::::::eeeeeeeeeee
#                             B::::B     B:::::B          a::::a    a:::::a           ssssss   s:::::s           e:::::::e
#                           BB:::::BBBBBB::::::B          a::::a    a:::::a           s:::::ssss::::::s          e::::::::e
#                           B:::::::::::::::::B           a:::::aaaa::::::a           s::::::::::::::s            e::::::::eeeeeeee
#                           B::::::::::::::::B             a::::::::::aa:::a           s:::::::::::ss              ee:::::::::::::e
#                           BBBBBBBBBBBBBBBBB               aaaaaaaaaa  aaaa            sssssssssss                  eeeeeeeeeeeeee
# "

loop do

  puts "
    ******************************************************
    *  Enter a command:                                  *
    *                                                    *
    *           Search  -  Search for a profile          *
    *              Add  -  Add an employee profile       *
    *           Delete  -  Delete an employee profile    *
    *    View Database  -  View all employee profiles    *
    *                                                    *
    *             Exit  -  Exit the program              *
    *                                                    *
    ******************************************************

"
  print "(Search/Add/Delete/View/Exit)?   "
  response = gets.chomp

  case response
    when "s", "s.", "search", "search.", "S", "S.", "Search", "Search.", "SEARCH", "SEARCH."
      searched_name = get_info ("Who's profile would you like to see?")
      p searched_name
      # Returns 0, 1, or more employees that match that name
      people = search(searched_name)

#     20.times do
#       puts ""
#     end

      if people.empty?
        puts "
                    Uh-oh
   The portfolio you asked for doesn't exist.
  Maybe you spelled it wrong, or started the program over.
      Retry or Add the persons portfolio:
  "
      else
        # This block will run for every element in the array
        # what is found in the array is anyone returned from the
        # search method we ran earlier
        people.each do |person|
          puts "
#{person.name}'s
            phone is     :   #{person.phone}
            address is   :   #{person.address}
            position is  :   #{person.position}
            salary is    :   #{person.salary}
            slack is     :   #{person.slack}
            github is    :   #{person.github}
"
        end
      end
#      20.times do
#        puts ""
#      end

    when "a", "a.", "add", "add.", "A", "A.", "Add", "Add.", "ADD", "ADD."
      name = get_info ("What is their name?")
      phone = get_info ("What is their phone number?")
      address = get_info ("What is their address?")
      position = get_info ("What is their position?")
      salary = get_info ("What is their salary?")
      slack = get_info ("What is their slack?")
      github = get_info ("What is their github?")
      person = Person.new(name, phone, address, position, salary, slack, github)
      @people << person
      save_employees
#      20.times do
#        puts ""
#      end
      puts "
    ********************************************
    *                                          *
    *  The employee profile has been created!  *
    *                                          *
    ********************************************
      "
#      20.times do
#        puts ""
#      end

    when "d", "d.", "delete", "delete.", "D", "D.", "Delete", "Delete.", "DELETE", "DELETE."
      delete_name = get_info ("Who's profile would you like to delete?")
      people = search (delete_name)
      if people.empty?
#       20.times do
#         puts ""
#       end
        puts "
    ***************************************
    *                                     *
    *  Couldn't find a matching profile.  *
    *                                     *
    ***************************************
          "
#       20.times do
#         puts ""
#       end
      else
        people.each do |person|
          @people.delete(person)
        end
#       20.times do
#         puts ""
#       end
        puts "
   ********************************************
   *                                          *
   *  The employee profile has been deleted.  *
   *                                          *
   ********************************************
          "
#       20.times do
#         puts ""
#       end
        save_employees
      end

    when "v", "v.", "view", "view.", "V", "V.", "View", "View.", "VIEW", "VIEW."
      @people.each do |person|
        puts "
#{person.name}'s
          phone is     :   #{person.phone}
          address is   :   #{person.address}
          position is  :   #{person.position}
          salary is    :   #{person.salary}
          slack is     :   #{person.slack}
          github is    :   #{person.github}
"
      end

    when "x", "x.", "exit", "exit.", "X", "X.", "Exit", "Exit.", "EXIT", "EXIT."
      break
    else
#      20.times do
#        puts ""
#      end
      puts "
  **********************************************************************************
  *                                                                                *
  *  I didn't understand, type what you would like to do (Search/Add/Delete/Exit)  *
  *                                                                                *
  **********************************************************************************
      "
#      20.times do
#        puts ""
#      end
  end
end
