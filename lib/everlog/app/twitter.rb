class Everlog
  class App::Twitter < App

    def self.fetch_since date
      config = Dom::Entity::Config.twitter
      api_response = Inf::Api::Twitter.new(config).timeline
      tweets = api_response.map { |r| Dom::Value::Twitter.new(r) if r.created_at > date }
      tweets.compact.reverse
    end
  end
end
