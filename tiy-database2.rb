@people = []

def get_info (data)
  print "#{data} "
  gets.chomp
end

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

puts "
TTTTTTTTTTTTTTTTTTTTTTT IIIIIIIIII YYYYYYY       YYYYYYY                  DDDDDDDDDDDDD                                   tttt
T:::::::::::::::::::::T I::::::::I Y:::::Y       Y:::::Y                  D::::::::::::DDD                             ttt:::t
T:::::::::::::::::::::T I::::::::I Y:::::Y       Y:::::Y                  D:::::::::::::::DD                           t:::::t
T:::::TT:::::::TT:::::T II::::::II Y::::::Y     Y::::::Y                  DDD:::::DDDDD:::::D                          t:::::t
TTTTTT  T:::::T  TTTTTT   I::::I   YYY:::::Y   Y:::::YYY                    D:::::D    D:::::D   aaaaaaaaaaaaa   ttttttt:::::ttttttt       aaaaaaaaaaaaa
        T:::::T           I::::I      Y:::::Y Y:::::Y                       D:::::D     D:::::D  a::::::::::::a  t:::::::::::::::::t       a::::::::::::a
        T:::::T           I::::I       Y:::::Y:::::Y                        D:::::D     D:::::D  aaaaaaaaa:::::a t:::::::::::::::::t       aaaaaaaaa:::::a
        T:::::T           I::::I        Y:::::::::Y      ---------------    D:::::D     D:::::D           a::::a tttttt:::::::tttttt                a::::a
        T:::::T           I::::I         Y:::::::Y       -:::::::::::::-    D:::::D     D:::::D    aaaaaaa:::::a       t:::::t               aaaaaaa:::::a
        T:::::T           I::::I          Y:::::Y        ---------------    D:::::D     D:::::D  aa::::::::::::a       t:::::t             aa::::::::::::a
        T:::::T           I::::I          Y:::::Y                           D:::::D     D:::::D a::::aaaa::::::a       t:::::t            a::::aaaa::::::a
        T:::::T           I::::I          Y:::::Y                           D:::::D    D:::::D a::::a    a:::::a       t:::::t    tttttt a::::a    a:::::a
      TT:::::::TT       II::::::II        Y:::::Y                         DDD:::::DDDDD:::::D  a::::a    a:::::a       t::::::tttt:::::t a::::a    a:::::a
      T:::::::::T       I::::::::I     YYYY:::::YYYY                      D:::::::::::::::DD   a:::::aaaa::::::a       tt::::::::::::::t a:::::aaaa::::::a
      T:::::::::T       I::::::::I     Y:::::::::::Y                      D::::::::::::DDD      a::::::::::aa:::a        tt:::::::::::tt  a::::::::::aa:::a
      TTTTTTTTTTT       IIIIIIIIII     YYYYYYYYYYYYY                      DDDDDDDDDDDDD          aaaaaaaaaa  aaaa          ttttttttttt     aaaaaaaaaa  aaaa

                          BBBBBBBBBBBBBBBBB
                          B::::::::::::::::B
                          B::::::BBBBBB:::::B
                          BB:::::B     B:::::B
                            B::::B     B:::::B            aaaaaaaaaaaaa                 ssssssssss                 eeeeeeeeeeee
                            B::::B     B:::::B            a::::::::::::a              ss::::::::::s              ee::::::::::::ee
                            B::::BBBBBB:::::B             aaaaaaaaa:::::a           ss:::::::::::::s            e::::::eeeee:::::ee
                            B:::::::::::::BB                       a::::a           s::::::ssss:::::s          e::::::e     e:::::e
                            B::::BBBBBB:::::B               aaaaaaa:::::a            s:::::s  ssssss           e:::::::eeeee::::::e
                            B::::B     B:::::B            aa::::::::::::a              s::::::s                e:::::::::::::::::e
                            B::::B     B:::::B           a::::aaaa::::::a                 s::::::s             e::::::eeeeeeeeeee
                            B::::B     B:::::B          a::::a    a:::::a           ssssss   s:::::s           e:::::::e
                          BB:::::BBBBBB::::::B          a::::a    a:::::a           s:::::ssss::::::s          e::::::::e
                          B:::::::::::::::::B           a:::::aaaa::::::a           s::::::::::::::s            e::::::::eeeeeeee
                          B::::::::::::::::B             a::::::::::aa:::a           s:::::::::::ss              ee:::::::::::::e
                          BBBBBBBBBBBBBBBBB               aaaaaaaaaa  aaaa            sssssssssss                  eeeeeeeeeeeeee
"

loop do



  puts "

*******************************************
*  Enter a command:                       *
*                                         *
*     Search  -  Search for a profile     *
*        Add  -  Add a profile            *
*     Delete  -  Delete a profile         *
*       Exit  -  Exit the program         *
*                                         *
*******************************************

"
print "(Search/Add/Delete/Exit)?   "
  response = gets.chomp

  case response
    when "s", "s.", "search", "search.", "S", "S.", "Search", "Search.", "SEARCH", "SEARCH."
      searched_name = get_info ("Who's profile would you like to see?")
      index = 0
      loop do

        if index >= @people.length
          10.times do
            puts ""
          end
          puts "
                      Uh-oh



     The portfolio you asked for doesn't exist.

Maybe you spelled it wrong, or started the program over.

        Retry or Add the persons portfolio:
"
        15.times do
          puts ""
        end
          break
        end

        person = @people[index]

        if searched_name == person.name
          10.times do
            puts ""
          end
          puts "
#{person.name}'s



            phone is     :   #{person.phone}

            address is   :   #{person.address}

            position is  :   #{person.position}

            salary is    :   #{person.salary}

            slack is     :   #{person.slack}

            github is    :   #{person.github}
"
          15.times do
            puts ""
          end

          break
        end

        index = index + 1
      end

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
      10.times do
        puts ""
      end
      puts "
    ***********************************
    *                                 *
    *  The profile has been created!  *
    *                                 *
    ***********************************
      "
      20.times do
        puts ""
      end

    when "d", "d.", "delete", "delete.", "D", "D.", "Delete", "Delete.", "DELETE", "DELETE."
      delete_name = get_info ("Who's profile would you like to delete?")
      index = 0
      loop do
        if index >= @people.length
          10.times do
            puts ""
          end
          puts "
          ***************************************
          *                                     *
          *  Couldn't find a matching profile.  *
          *                                     *
          ***************************************
          "
          20.times do
            puts ""
          end
          break
        end

        person = @people[index]

        if delete_name == person.name
          @people.delete(person)
          10.times do
            puts ""
          end
          puts "
             ********************************
             *                              *
             *  The user has been deleted.  *
             *                              *
             ********************************
          "
          20.times do
            puts ""
          end
          break
        end

        index = index + 1
      end

    when "x", "x.", "exit", "exit.", "X", "X.", "Exit", "Exit.", "EXIT", "EXIT."
      break
    else
      10.times do
        puts ""
      end
      puts "
      **********************************************************************************
      *                                                                                *
      *  I didn't understand, type what you would like to do (Search/Add/Delete/Exit)  *
      *                                                                                *
      **********************************************************************************
      "
      20.times do
        puts ""
      end
  end



end
