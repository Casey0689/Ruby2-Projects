#kingdom, phylum, class, order family genus species
class Animal
  attr_accessor :color, :name
  def initialize(color, name)
    @color = color
    @name = name
  end
  def to_s
    return "My name is #{@name}, I am #{@color}"
  end
end

class Fish < Animal
  attr_accessor :num_fins
  def initialize(color, name, num_fins)
    super( color, name)
    @num_fins = num_fins
  end

  def to_s
    return "#{super}, and I have #{@num_fins} fins"
  end
end

class Bird < Animal
  include Comparable
  attr_accessor :num_wings
  #attr_writer :can_fly
  def initialize(color, name, num_wings, can_fly)
    super(color, name)
    @num_wings = num_wings
    @can_fly = can_fly
  end

  def <=>( other )
    return ( @name <=> other.name )#&& @color == other.color && @num_wings == other.num_wings &&  @can_fly == other.can_fly? )
  end

  def can_fly?
    return @can_fly
  end

  def to_s
    return "#{super}, and I have #{@num_wings} wings!"
  end
end

buffalo = Animal.new("Brown", "Buffy")
puts buffalo

dory = Fish.new("Pink", "Dory", 3)
dory.num_fins = 3
puts dory
puts dory.inspect

dodo = Bird.new("Black", "Raven", 2, true)
dodo1 = Bird.new("Black", "Raven", 2, true)

puts "Equality:"
puts dodo<=>(dodo1)
puts dodo!=(dodo1)
puts dodo<(dodo1)
puts dodo>(dodo1)
puts dodo<=(dodo1)
puts dodo>=(dodo1)