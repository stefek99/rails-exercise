require 'net/http'
require 'rexml/document'

class ProductsController < ApplicationController

  def index
    @feed_urls = feed_urls

    if (params[:lang]) then
      lang = params[:lang]
      @feed_data = get_feed(feed_urls[lang])
    end
  end

  def get_feed(url)
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    doc = REXML::Document.new(xml_data)
    items_to_display = Array.new
    counter = 0
    doc.elements.each('rss/channel/item') do |item|
       a = item.get_elements("title")[0].text
       b = item.get_elements("link")[0].text
       c = item.get_elements("g:image_link")[0].text
       items_to_display << [a, b, c]
       counter = counter + 1
       if counter == 5 then return items_to_display end
    end
  end

end
