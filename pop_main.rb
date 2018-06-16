# DO ALL THE USER INTERFACE, GETTING MONEY FROM USER, DISPLAY A MENU
require_relative("candy.rb")
require_relative( "pop.rb" )
require_relative("vending_machine.rb")

pop_machine = VendingMachine.new
 #Read data from a file
 #  read a line,
 #  create a pop,
 #  call add_item
root_beer = Pop.new("RootBeer", true, true, 12, 1.50)
orange = Pop.new("Orange Zap", false, true, 12, 1.50)
mars = Candy.new("Mars Bar", false, true, 8, 0.95)

pop_machine.add_item( root_beer )
pop_machine.add_item( orange )
pop_machine.add_item( mars )

puts pop_machine.inspect
puts pop_machine.display_selections

=begin

print "Please enter a item selection: "
user_selection = gets.to_i
item = pop_machine.get_item( user_selection )
puts item.display


while pop_machine.user_money < item.cost
  print "Enter some change: "
  coins = gets.to_f
  puts coins
  pop_machine.add_user_money( coins )
  puts "Current money: #{pop_machine.display_user_money}"
end

pop_machine.dispense_item( user_selection )
puts "Here is your #{item}"
puts "Money left in machine: #{pop_machine.user_money}"
puts "would you like your change? (y/n) "
change = gets.chomp.downcase
if change == "y"
  puts "Your change is #{pop_machine.return_change}"
end

puts pop_machine.user_money
print "Enter a price to query: "
price = gets.to_f

item = pop_machine.find_pops_worth( price )
puts "All items in the pop machine worth: #{price}"
items.each do | item |
  puts item
end

=end

print "what pops are you interested in?: "
pop_names = gets.chomp
matching_pops = pop_machine.find_all_pops_matching( pop_names )
puts matching_pops.inspect


#Save all the items to the disk
#  open file save_data = File.open("list.txt", "w")
#  loop to get all the items in the VendingMachine
#  in a format suitable for writing to a disk
#  save_data.close
