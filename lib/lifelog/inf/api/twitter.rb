class Lifelog
  class Inf::Api::Twitter < Inf::Api
    require 'twitter'

    def client
      @client ||= ::Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_consumer_key']
        config.consumer_secret     = ENV['twitter_consumer_sec']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_secret']
      end
    end

    def timeline
      client.user_timeline('gong023', { count: 200 })
    rescue
      []
    end
  end
end
