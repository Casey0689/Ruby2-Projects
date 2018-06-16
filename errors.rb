# <e\sid="(\d+)">(.+?)</e>

# line = '  <e id="114">Unable to download an authentication module. Please try again later.</e>'
# puts line =~ /<e\sid="(\d+)">(.+?)<\/e>/
# puts $1, $2

class Error
  attr_accessor :id, :message
  def initialize( id, message )
    @id = id
    @message = message
  end

  def to_xml
    return "<e id=\"#{@id}\">#{@message}</e>"
  end

  def to_s
    return "[#{@id}] #{@message}"
  end
end

errors = []
errors << Error.new( $1, $2 )
puts errors.inspect

blizzard_file = File.open("blizzarderrors.xml")
while !blizzard_file.eof?
  if ( blizzard_file.gets.chomp =~ /<e\sid="(\d+)">(.+?)<\/e>/ )
    errors << Error.new( $1, $2 )
  end
end
blizzard_file.close()

errors.each do | error |
  puts error.to_xml
end