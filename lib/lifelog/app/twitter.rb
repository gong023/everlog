class Lifelog
  class App::Twitter < App
    require 'lifelog/inf/api/twitter'
    require 'lifelog/dom/value/twitter'

    class << self
      def today
        fetch_since (DateTime.now - 1).to_time
      end

      def fetch_since date
        api_response = Inf::Api::Twitter.new.timeline
        tweets = api_response.map { |r| Dom::Value::Twitter.new(r) if r.created_at > date }
        tweets.compact.reverse
      end
    end
  end
end
