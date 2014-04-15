class Everlog
  class App::Hatena < App
    def self.fetch_since date
      config = Dom::Entity::Config.hatena
      api_response = Inf::Api::Hatena.new(config).feed_entry
      bookmarks = api_response.map do |r|
        feed = Dom::Value::Hatena.new(r)
        feed.issued > date ? feed : nil
      end
      bookmarks.compact
    end
  end
end
