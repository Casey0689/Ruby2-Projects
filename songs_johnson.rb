############################################################
#
#  Name:         Casey Johnson
#  Date:         5/3/2017
#  Assignment:   Jukebox
#  Class:        CIS - 283
#  Description:  Create a jukebox to store a list of songs
#
############################################################

class Song
  attr_accessor :track_name, :artist, :album, :year, :length_in_s
  def initialize( track_name, artist, album, year, length_in_s)
    @track_name = track_name
    @artist = artist
    @album = album
    @year = year
    @length_in_s = length_in_s
  end

  def to_s
    return "Track: #{@track_name},\tArtist: #{@artist},\tAlbum: #{@album},\tYear-made: #{@year},\tLength in sec: #{@length_in_s}"
  end
end