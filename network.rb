require 'net/https'
require 'prawn'

website = ARGV[0]
puts website
puts ARGV.inspect

# response = Net::HTTP.get_response( website, '/')
# puts response.body

a = "<img src='a'/>This is a <img src='b'/>test".scan(/<img .*?\/>/)
puts a.inspect

a.each do | img_tag |
  puts img_tag.scan(/src='(.+)'/).inspect
  #Get the link and the click text
  #Create a link object from that
  #check link object for its response code

end

Prawn::Document.generate( "helloworld.pdf" ) do | pdf |
  pdf.stroke_axis
  pdf.font "Courier", :size => 24
  pdf.text "Hello World", :align => :center
  pdf.font "Courier", :size => 10
  pdf.text website
  pdf.start_new_page
  pdf.font "Courier", :size => 16
  pdf.text "This is a test of the emergency broadcast system"

  pdf.stroke_color = "ff0000"
  pdf.line_width = 5
  pdf.stroke do
    pdf.circle( [300,300], 100 )
    pdf.circle( [350,320], 20 )
    pdf.circle( [260,325], 20 )
    pdf.curve [270,250], [340,250], :bounds => [[270,270],[200,250]]
  end
end
