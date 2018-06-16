=begin
html = "<html><a href='test'>click me</a><a href='test'>click me</a><a href='test'>click me</a><a href='test'>click me</a></html>"
puts html.split(/<a.*?>/)
print "509-999-9999".scan(/\d{3,4}/)
=end

print "Enter your name: "
name = gets.chomp
print "Enter your last name: "
last_name = gets.chomp
print"Enter a bunch of text: "
text = gets.chomp

puts text =~ / #{name} #{last_name} /

puts name
puts text

text = []
text.each_with_index do |line, index|
  next_line = text[index + 1]
end
