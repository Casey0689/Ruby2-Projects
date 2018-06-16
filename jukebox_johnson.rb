############################################################
#
#  Name:         Casey Johnson
#  Date:         5/3/2017
#  Assignment:   Jukebox
#  Class:        CIS - 283
#  Description:  Create a jukebox to store a list of songs
#
############################################################

class Jukebox
  attr_accessor :power, :selection
  def initialize
    @power = "off"
    @selection = ""
    @songs = []
  end

  def add_song( song )
    @songs << song
  end

  def delete_song( song_num )
    @songs.delete_at( song_num - 1 )
  end

  def display_songs
    song_list = ""
    @songs.each_with_index do | song, index |
      song_list += "#{index + 1}. #{song}\n"
    end
    return song_list
  end

  def find_artist( artist )
    return @songs.select{ |song| song.artist.downcase =~ /\A#{artist.downcase}\z/ }
  end

  def find_longest_song( lis )
    temp_array_of_songs = []
    @songs.each do | song |
      if lis <= song.length_in_s
        temp_array_of_songs << song
      end
    end
    return temp_array_of_songs
  end

  def play_song( track_name )
    @songs.each do | song |
      if song.track_name.downcase =~ /\A#{track_name.downcase}\z/
        return "Now Playing. . .\t#{song}\nYou start dancing like you don't care who's watching!"
      end
    end
  end

  def update_song( current, new )
    delete_song( current )
    add_song( new )
  end

end