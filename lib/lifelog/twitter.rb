class Lifelog
  class TwitterApp
    require 'twitter'

    def client
      @client ||= ::Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_consumer_key']
        config.consumer_secret     = ENV['twitter_consumer_sec']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_secret']
      end
    end

    def today
      fetch_by_date (DateTime.now - 1).to_time
    end

    private
    def fetch_by_date(date)
      api_response = client.user_timeline('gong023', { count: 200 })
      tweets = api_response.map { |r| Twitter.new(r) if r.created_at > date }
      tweets.compact.reverse
    end
  end

  class Twitter < NullObject
    include Maybe
    def initialize(response)
      @response = response
    end

    def tweet
      maybe(@response.text).to_s
    end
  end
end
