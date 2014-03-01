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
      timeline = client.user_timeline('gong023', { count: 200 })

      timeline.map do |t|
        Twitter.new(t) if t.created_at > (DateTime.now - 1).to_time
      end.compact.reverse
    end
  end

  class NullObject
    def method_missing(*args, &block)
      self
    end

    def to_a; []; end
    def to_s; ''; end
    def to_i; 0; end
    def to_f; 0.0; end
  end

  module Maybe
    def maybe value
      value.nil? ? NullObject.new : value
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
