class ApplicationController < ActionController::Base
  protect_from_forgery

  def feed_urls
  {"english" => "http://www.arenaflowers.com/files/sitemaps/arenaflowers.com/google_base_feed.xml",
  "french" => "http://www.arenafleurs.fr/files/sitemaps/arenafleurs.fr/google_base_feed.xml",
  "german" => "http://www.arenablumen.de/files/sitemaps/arenablumen.de/google_base_feed.xml"}
  end

end
