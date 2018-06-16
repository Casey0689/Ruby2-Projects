############################################################
#
#  Name:         Casey Johnson
#  Date:         5/17/2017
#  Assignment:   Character Playoffs
#  Class:        CIS - 283
#  Description:  Make two characters battle to the death
#
############################################################

class Item
  attr_accessor :name
  def initialize( name )
    @name = name
  end
end

class Weapon1 < Item
  attr_accessor :dmg_hits
  def initialize( name, dmg_hits )
    super( name )
    @dmg_hits = dmg_hits
  end

  def to_s
    return "#{@name}, damage of: #{@dmg_hits}"
  end
end

class Armor < Item
  attr_accessor :protect_hits
  def initialize( name, protect_hits )
    super( name )
    @protect_hits = protect_hits
  end

  def to_s
    return "#{@name} armor, protects: #{@protect_hits}"
  end
end