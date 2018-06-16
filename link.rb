############################################################
#
#  Name:         Casey Johnson
#  Date:         5/31/2017
#  Assignment:   Web Crawler
#  Class:        CIS - 283
#  Description:  Create a Link checker to check the data of links
#
############################################################

class LinkChecker
  def initialize( base_url )
    @@base_url = base_url
    @links = []
  end

  def add_link( link )
    @links << link
  end

  def check_link
    @links.each do | link |
      if link.link =~ /\A[\/#]/ || link.link =~ /.*adobe/
        link.link_type = "Internal"
      else
        link.link_type = "External"
      end
    end
    @links.each do | link |
      if link.link =~ /\A[\/#]/ || link.link =~ /\A[\/#]\w/
        link.link = "#{@@base_url}#{link.link}"
      end
      #response = Net::HTTP.get_response( link.link, '/' )
      #link.code = response.code
    end
  end

  def list_all_links
    link_list = ""
    @links.each_with_index do | link, index |
      link_list += "#{index + 1}. #{link}\n"
    end
    return link_list
  end
end


class Link < LinkChecker
  attr_accessor :link, :click_value, :link_type, :code
  def initialize(link, click_value)
    @link = link
    @click_value = click_value
  end

  def to_s
    return "#{@link},\t#{@click_value},\t#{@link_type},\tCode: #{@code}"
  end
end

