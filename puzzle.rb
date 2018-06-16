############################################################
#
#  Name:         Casey Johnson
#  Date:         6/13/2017
#  Assignment:   Word Search Final
#  Class:        CIS - 283
#  Description:  Create a word search and print out to a pdf.
#
############################################################
require_relative('PuzzleClass.rb')
require 'prawn'

puzzle = Puzzle.new( 45 )

words_file = File.open('words.txt')
while !words_file.eof?
  new_word = words_file.gets.chomp.upcase.gsub(" ", "")
  puzzle.add_word( new_word )
end
words_file.close()

puzzle.solve
puts puzzle.to_s


Prawn::Document.generate("puzzle.pdf") do | pdf |
  pdf.text "Answer Key", :align => :center, :size => 12
  pdf.text "\n"
  pdf.font "Courier", :size => 10
  pdf.text "#{puzzle.to_s}\n", :align => :center
  pdf.text "Words to Find:", :align => :center, :size => 12
  pdf.text "\n"
  pdf.text "#{puzzle.list_words}", :align => :center, :size => 10
  pdf.start_new_page
  puzzle.encode
  pdf.text "Crossword Puzzle", :align => :center, :size => 12
  pdf.text "\n"
  pdf.font "Courier", :size => 10
  pdf.text "#{puzzle.to_s}\n", :align => :center
  pdf.text "Words to Find:", :align => :center, :size => 12
  pdf.text "\n"
  pdf.text "#{puzzle.list_words}", :align => :center, :size => 10
end
