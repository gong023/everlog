class Lifelog
  class App::Hatena < App
    def self.fetch_since date
      api_response = Inf::Api::Hatena.new.feed_entry
      bookmarks = api_response.map do |r|
        feed = Dom::Value::Hatena.new(r)
        feed.issued > date ? feed : nil
      end
      bookmarks.compact
    end
  end
end
