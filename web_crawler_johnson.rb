############################################################
#
#  Name:         Casey Johnson
#  Date:         5/31/2017
#  Assignment:   Web Crawler
#  Class:        CIS - 283
#  Description:  Create a Link checker to check the data of links
#
############################################################

require 'prawn'
require_relative("link.rb")
require 'net/https'

website = ARGV[0]
puts website
puts ARGV.inspect

response = Net::HTTP.get_response( website, '/')
#puts response.body
link_checker = LinkChecker.new( website )

anchors = response.body.scan(/<a\s+.*>.*?<\/a>?/)
puts anchors.count

anchors.each do | a |
  a.scan(/\s+href="(.*?)"\s?/)
  href = $1
  a.scan(/<a\s+.*>(.*?)<\/a>?/)
  cv = $1
  link = Link.new(href, cv)
  link_checker.add_link( link )
  link_checker.check_link
end
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
puts link_checker.list_all_links

Prawn::Document.generate( "webcrawler.pdf" ) do | pdf |
  pdf.fill_color = "315ff7"
  pdf.font "Courier", :size => 24
  pdf.text "Web Crawler", :align => :center
  pdf.fill_color = "000000"
  pdf.font "Courier", :size => 18
  pdf.text website, :align => :left
  pdf.font "Courier", :size => 12
  Prawn::Font::AFM.hide_m17n_warning = true
  pdf.text "#{link_checker.list_all_links}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace).force_encoding(Encoding::Windows_1252)
end


