############################################################
#
#  Name:         Casey Johnson
#  Date:         5/17/2017
#  Assignment:   Character Playoffs
#  Class:        CIS - 283
#  Description:  Make two characters battle to the death
#
############################################################

class Character1
  attr_accessor :name, :race, :total_hp, :current_hp, :strength, :agility, :weapon, :armor
  def initialize(name, race, total_hp, strength, agility)
    @name = name
    @race = race
    @total_hp = total_hp
    if @total_hp > 100
      @total_hp = 100
    end
    @current_hp = total_hp
    if @current_hp > 100
      @current_hp = 100
    end
    @strength = strength
    if @strength > 50
      @strength = 50
    end
    @agility = agility
    if @agility > 10
      @agility = 10
    end

  end

  def current_status
    #Print out current status of the character
    return "Current Hit Points is #{@current_hp}"
  end

  def get_armor( armor )
    @armor = armor
  end

  def get_weapon( weapon )
    @weapon = weapon
  end

  def reduce_hits( damage )
    @current_hp -= damage
    if @current_hp < 0
      @current_hp = 0
    end
  end

  def revive_character
    @current_hp = @total_hp
  end

  def to_s
    weapon = (@weapon) ? ", I weild a #{@weapon}" : ""
    armor = (@armor) ? ", I were #{@armor}" : ""
    return "Name is #{@name}, I am a #{@race}, with #{@total_hp} hit points, strength is #{@strength}, agility is #{@agility}#{weapon}#{armor}"
  end
end