class ProductsController < ApplicationController

  def index
    logger.debug "PARAMS #{params.inspect}"
    @feed_urls = feed_urls
    lang = params[:lang]
    @feed_url = feed_urls[lang]

  end

    def get_feed(url)


  end

end
