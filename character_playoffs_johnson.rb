############################################################
#
#  Name:         Casey Johnson
#  Date:         5/17/2017
#  Assignment:   Character Playoffs
#  Class:        CIS - 283
#  Description:  Make two characters battle to the death
#
############################################################

require_relative("Character.rb")
require_relative("Dice.rb")
require_relative("Item.rb")

menu_options = [
    "1) Load Character 1",
    "2) Load Character 2",
    "3) Fight",
    "4) Quit"
]

d4 = Dice.new(4)
d5 = Dice.new(5)
d8 = Dice.new(8)
d10 = Dice.new(10)
d15 = Dice.new(15)

user_input = 0
while user_input != 4
  puts menu_options
  print "Select 1 - 4: "
  user_input = gets.to_i
  case user_input
    when 1
      puts "Enter the character file you want to load: "
      character1 = gets.chomp
      character1_array = []
      character1_file = File.open("#{character1}")
      while !character1_file.eof?
        character1_string = character1_file.gets.chomp.split(",")
        character1_array << character1_string
      end
      character1_file.close()
      character1 = Character1.new(character1_array[0][0], character1_array[0][1].capitalize, character1_array[0][2].to_i, character1_array[0][3].to_i, character1_array[0][4].to_i)
      c1weapon = Weapon1.new(character1_array[1][0].capitalize, character1_array[1][1].to_i)
      c1armor = Armor.new(character1_array[2][0].capitalize, character1_array[2][1].to_i)
      character1.get_weapon(c1weapon)
      character1.get_armor(c1armor)
      character1_agility_die = Dice.new(character1.agility)
    when 2
      puts "Enter the character file you want to load: "
      character2 = gets.chomp
      character2_array = []
      character2_file = File.open("#{character2}")
      while !character2_file.eof?
        character2_string = character2_file.gets.chomp.split(",")
        character2_array << character2_string
      end
      character2_file.close()
      character2 = Character1.new(character2_array[0][0], character2_array[0][1].capitalize, character2_array[0][2].to_i, character2_array[0][3].to_i, character2_array[0][4].to_i)
      c2weapon = Weapon1.new(character2_array[1][0], character2_array[1][1].to_i)
      c2armor = Armor.new(character2_array[2][0], character2_array[2][1].to_i)
      character2.get_weapon(c2weapon)
      character2.get_armor(c2armor)
      character2_agility_die = Dice.new(character2.agility)
    when 3
      character1_roll = character1_agility_die.roll.to_i
      character2_roll = character2_agility_die.roll.to_i
      if character1_roll == character2_roll
        puts "Re-Roll"
      elsif character1_roll > character2_roll
        while character1.current_hp > 0 && character2.current_hp > 0
          puts "#{character1.name} Swings"
          roll = d10.roll.to_i
          if roll < character2.agility
            hits = (character1.strength * (1.0 / d4.roll.to_i) + (c1weapon.dmg_hits) / d8.roll.to_i).to_i
            armor_save = (c2armor.protect_hits / d15.roll.to_i)
            damage = (hits - armor_save)
            if damage < 0
              damage = 0
            end
            character2.reduce_hits(damage)
            if character2.current_hp < 0
              character2.current_hp = 0
            end
            puts "#{character1.name} fights with the #{character1.weapon}:\n\tHit: #{hits}\t#{character2.name}'s armor saved #{armor_save}\n\t#{character2.name}'s hits are reduced by #{damage} points.\n\t#{character2.name} has #{character2.current_hp} left out of #{character2.total_hp}"
          else
            puts "#{character1.name} Misses"
          end
          gets
          puts "#{character2.name} Swings"
          roll = d10.roll.to_i
          if roll < character1.agility
            hits = (character2.strength * (1.0 / d4.roll.to_i) + (c2weapon.dmg_hits) / d8.roll.to_i).to_i
            armor_save = (c1armor.protect_hits / d15.roll.to_i)
            damage = (hits - armor_save)
            if damage < 0
              damage = 0
            end
            character1.reduce_hits(damage)
            puts "#{character2.name} fights with the #{character2.weapon}:\n\tHit: #{hits}\t#{character1.name}'s armor saved #{armor_save}\n\t#{character1.name}'s hits are reduced by #{damage} points.\n\t#{character1.name} has #{character1.current_hp} left out of #{character1.total_hp}"
          else
            puts "#{character2.name} Misses"
          end
          gets
        end
        if character1.current_hp == 0
          puts "#{character2.name} Wins!"
          puts
        elsif character2.current_hp == 0
          puts "#{character1.name} Wins!"
          puts
        end
        gets
      elsif character1_roll < character2_roll
        while character1.current_hp > 0 && character2.current_hp > 0
          puts "#{character2.name} Swings"
          roll = d10.roll.to_i
          if roll < character1.agility
            hits = (character2.strength * (1.0 / d4.roll.to_i) + (c2weapon.dmg_hits) / d8.roll.to_i).to_i
            armor_save = (c1armor.protect_hits / d15.roll.to_i)
            damage = (hits - armor_save)
            if damage < 0
              damage = 0
            end
            character1.reduce_hits(damage)
            if character1.current_hp < 0
              character1.current_hp = 0
            end
            puts "#{character2.name} fights with the #{character2.weapon}:\n\tHit: #{hits}\t#{character1.name}'s armor saved #{armor_save}\n\t#{character1.name}'s hits are reduced by #{damage} points.\n\t#{character1.name} has #{character1.current_hp} left out of #{character1.total_hp}"
          else
            puts "#{character2.name} Missed"
          end
          gets
          puts "#{character1.name} Swings"
          roll = d10.roll.to_i
          if roll < character2.agility
            hits = (character1.strength * (1.0 / d4.roll.to_i) + (c1weapon.dmg_hits) / d8.roll.to_i).to_i
            armor_save = (c2armor.protect_hits / d15.roll.to_i)
            damage = (hits - armor_save)
            if damage < 0
              damage = 0
            end
            character2.reduce_hits(damage)
            puts "#{character1.name} fights with the #{character1.weapon}:\n\tHit: #{hits}\t#{character2.name}'s armor saved #{armor_save}\n\t#{character2.name}'s hits are reduced by #{damage} points.\n\t#{character2.name} has #{character2.current_hp} left out of #{character2.total_hp}"
          else
            puts "#{character1.name} Misses"
          end
          gets
        end
        if character1.current_hp == 0
          puts "#{character2.name} Wins!"
          puts
        elsif character2.current_hp == 0
          puts "#{character1.name} Wins!"
          puts
        end
        gets
      end
      character1.revive_character
      character2.revive_character
    when 4
      #Quit the program
    else
      puts "Invalid Entry!"
  end
end