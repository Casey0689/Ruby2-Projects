############################################################
#
#  Name:         Casey Johnson
#  Date:         5/3/2017
#  Assignment:   Jukebox
#  Class:        CIS - 283
#  Description:  Create a jukebox to store a list of songs
#
############################################################

require_relative("songs_johnson.rb")
require_relative("jukebox_johnson.rb")

menu_options = [
    "1. Show all songs longer than entered value in seconds",
    "2. Show all songs by specific artist",
    "3. Play a specific song",
    "4. Add a new song to the jukebox",
    "5. Delete a song from the jukebox",
    "6. Update a song in the jukebox",
    "7. Show all songs in the jukebox",
    "8. Power Off"
]

jukebox = Jukebox.new
song_file = File.open("songs.txt")
while !song_file.eof?
  song_array = song_file.gets.chomp.split("\t")
  new_song = Song.new(song_array[0], song_array[1], song_array[2], song_array[3], song_array[5].to_i)
  jukebox.add_song( new_song )
end
song_file.close()

menu_selection = 0
while menu_selection != menu_options.count
  puts menu_options
  print "Make a selection from the menu: "
  puts
  menu_selection = gets.to_i
  case menu_selection
    when 1
      # Show all songs longer than entered value in seconds
      print "Enter in seconds: the shortest time you want to hear in a song: "
      lis = gets.to_i
      puts jukebox.find_longest_song( lis )
      puts
    when 2
      # Show all songs by specific artist
      print "Enter an artist to display their songs: "
      artist = gets.chomp
      puts jukebox.find_artist( artist )
      puts
    when 3
      # Play a song
      print "Enter a track name to play: "
      track_name = gets.chomp
      if track_name == ""
        puts "Invalid option"
      else
        puts jukebox.play_song( track_name )
      end
      puts
    when 4
      # Add a song
      print "Enter a track name to add: "
      song_name = gets.chomp
      print "Enter the artist: "
      song_artist = gets.chomp
      print "Enter the album name: "
      album_name = gets.chomp
      print "Enter the year it was made: "
      year = gets.chomp
      print "Enter the song length in seconds: "
      lis = gets.to_i
      new_song = Song.new( song_name, song_artist, album_name, year, lis )
      jukebox.add_song( new_song )
      puts
    when 5
      # Delete Song
      print "Enter the song number you want to delete: "
      song_num = gets.to_i
      if song_num == 0
        puts "Invalid Option"
      else
        jukebox.delete_song( song_num )
      end
      puts
    when 6
      # Update the Song
      puts jukebox.display_songs
      puts
      print "Which song do you want to update: "
      song_num = gets.to_i
      if song_num == 0
        puts "Invalid Option"
      else
        jukebox.delete_song( song_num )
      end
      print "Enter track name: "
      song_name = gets.chomp
      print "Enter artist: "
      song_artist = gets.chomp
      print "Enter album name: "
      album_name = gets.chomp
      print "Enter year it was made: "
      year = gets.chomp
      print "Enter length in seconds of the song: "
      lis = gets.to_i
      new_song = Song.new( song_name, song_artist, album_name, year, lis )
      jukebox.add_song( new_song )
      puts
    when 7
      # Display song
      puts jukebox.display_songs
      puts
    when 8
      song_file = File.open("songs.txt", 'r+')
      song_file.puts "#{jukebox.display_songs}"
      song_file.close()
    else
      puts "Wrong input, try again..."
      puts
  end
end
