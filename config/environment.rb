# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RailsExercise::Application.initialize!


  def feed_url
      {:english => "http://www.arenaflowers.com/files/sitemaps/arenaflowers.com/google_base_feed.xml",
:french => "http://www.arenafleurs.fr/files/sitemaps/arenafleurs.fr/google_base_feed.xml",
:german => "http://www.arenablumen.de/files/sitemaps/arenablumen.de/google_base_feed.xml"}
  end
