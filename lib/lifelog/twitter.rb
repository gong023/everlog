class Lifelog
  class Twitter
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
      one_day_ago = (DateTime.now - 1).to_time
      client.user_timeline('gong023', { count: 200 }).map do |tweet|
        tweet.text if tweet.created_at > one_day_ago
      end.compact.reverse
    end
  end
end
