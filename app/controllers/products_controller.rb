require 'net/http'
require 'rexml/document'

class ProductsController < ApplicationController

  def index
    @feed_urls = feed_urls
    if (params[:lang]) then
      lang = params[:lang]
      cookies[:lang] = {:value => lang, :expires => 7.days.from_now }
    elsif (cookies[:lang]) then
      lang = cookies[:lang]
    end
    if lang then
      @feed_data = get_feed(feed_urls[lang])
      @cookie = cookies[:lang]
    end

  end

  def reset_cookie
    cookies.delete :lang
    redirect_to :action => "index"
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
       items_to_display << [:title=>a, :link=>b, :image=>c]
       counter = counter + 1
       if counter == 5 then return items_to_display end
    end
  end

end
