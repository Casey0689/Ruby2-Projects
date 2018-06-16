############################################################
#
#  Name:         Casey Johnson
#  Date:         5/17/2017
#  Assignment:   Character Playoffs
#  Class:        CIS - 283
#  Description:  Make two characters battle to the death
#
############################################################

class Dice
  def initialize( num_sides )
    @num_sides = num_sides
  end
  def roll
    return "#{rand(1..@num_sides)}"
  end
end

=begin

dAgilityC1 = Dice.new( agility )

def fight( c1, c2 )

end


#MAIN PROGRAM
#see who goes first
if( c1 is first )
  fight(c1, c2)
  fight(c2, c1)
else
  fight( c2, c1 )
  fight( c1, c2 )
end

puts "#{c1.name} fights with a #{c1.weapon.name}"
puts c1.fightString

puts "press enter to continue to the next round"
pause = gets

#PEGGING A VARIABLE
class Whatever
  def initialize( hit_points )

    @max_hits = hit_points
    if(@hit_points > 100)
      @hit_points = 100
    end
    @current_hits = hit_points
  end

  def reduce_hits ( hits )
    @current_hits -= hits
    if @current_hits < 0
      @current_hits = 0
    end
  end
end

=end
