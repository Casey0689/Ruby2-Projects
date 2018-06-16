############################################################
#
#  Name:         Casey Johnson
#  Date:         4/12/2017
#  Assignment:   Text search with regular expressions
#  Class:        CIS-283
#  Description:  Enter description and class number to find results
#
############################################################

text = []
text_file = File.open("Enrollment.txt")
while ! text_file.eof?
  course_info = text_file.gets.chomp
  text << course_info
end
text_file.close()

description = " "
while description != "EXIT"
  print "Please enter course description: "
  description = gets.chomp.upcase
  print "Please enter course number: "
  course_num = gets.chomp
  text.each_with_index do | line, index |
    if line =~ /#{description}\s+#{course_num}/
      puts line
      next_line = text[ index + 1 ]
      while next_line =~ /\A\s{6,}./
        puts next_line
        next_line = next_line[ index + 1 ]
        next_line[ index ] += 1
      end
    end
  end
end

