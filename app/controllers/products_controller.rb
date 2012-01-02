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
    doc.elements.each('rss/channel/item') do |item|
       puts item.get_elements("title")
       puts item.get_elements("link")
       puts item.get_elements("g:image_link")
       return item.get_elements("g:image_link")
    end
  end

end
