############################################################
#
#  Name:         Casey Johnson
#  Date:         4/12/2017
#  Assignment:   Ruby Classes
#  Class:        CIS-283
#  Description:  Creating a few ruby classes
#
############################################################

class Person
  def initialize( first_name, last_name, age, hair_color, eye_color )
    @first_name = first_name
    @last_name = last_name
    @age = age
    @hair_color = hair_color
    @eye_color = eye_color
  end

  def first_name
    return @first_name
  end

  def first_name=( first_name )
    @first_name = first_name
  end

  def last_name
    return @last_name
  end

  def last_name=( last_name )
    @last_name = last_name
  end

  def age
    return @age
  end

  def age=( age )
    @age = age
  end

  def hair_color
    return @hair_color
  end

  def hair_color=( hair_color )
    @hair_color = hair_color
  end

  def eye_color
    return @eye_color
  end

  def eye_color=( eye_color )
    @eye_color = eye_color
  end

  def to_s
    return "First Name: #{@first_name}\nLast Name: #{@last_name}\nAge: #{@age}\nHair Color: #{@hair_color}\nEye Color: #{@eye_color}"
  end

end

class Address

  def initialize( line1, city, state, zip )
    @line1 = line1
    @line2
    @city = city
    @state = state
    @zip = zip
  end

  def line1
    return @line1
  end

  def line1=( line1 )
    @line1 = line1
  end

  def line2
    return @line2
  end

  def line2=( line2 )
    @line2 = line2
  end

  def city
    return @city
  end

  def city=( city )
    @city = city
  end

  def state
    return @state
  end

  def state=( state )
    @state = state
  end

  def zip
    return @zip
  end

  def zip=( zip )
    @zip = zip
  end

  def to_s
    return "#{@line1}\n#{@line2}\n#{@city}\n#{@state}\n#{@zip}"
  end

end

class Character

  def initialize( name, race, hit_points, gold)
    @name = name
    @race = race
    @hit_points = hit_points
    @weapons = []
    @gold = gold
    @clothing = []
  end

  def name
    return @name
  end

  def name=( name )
    @name = name
  end

  def race
    return @race
  end

  def race=( race )
    @race = race
  end

  def hit_points
    return @hit_points
  end

  def hit_points=( hit_points )
    @hit_points = hit_points
  end

  def weapons
    return @weapons
  end

  def add_weapon( weapon )
    @weapons << weapon
  end

  def remove_weapon( weapon )
    @weapons.delete( weapon )
  end

  def gold
    return @gold
  end

  def gold=( gold )
    @gold = gold
  end

  def clothing
    return @clothing
  end

  def add_clothing( cloth )
    @clothing << cloth
  end

  def remove_clothing( cloth )
    @clothing.delete( cloth )
  end

  def to_s
    return "Name: #{@name}\nRace: #{@race}\nHit Points: #{@hit_points}\nWeapons: \n\t" + @weapons.join(", ") + "\nGold: #{@gold}\nCloths: \n\t" + @clothing.join(", ")
  end

end

casey = Person.new("Casey", "Johnson", 27, "Brown", "Hazel")
puts casey
puts
guy = Character.new("Kronk", "Orc", "200", "320")
guy.add_weapon("Axe")
guy.add_weapon("Bow")
guy.add_clothing("Pants")
guy.add_clothing("Robe")
puts guy.to_s
puts
address = Address.new("14512 E Broadway Ave", "Spokane Valley", "Washington", "99216")
puts address