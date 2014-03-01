class Lifelog
  class Inf::Api::Hatena < Inf::Api
    require 'hatena-bookmark'

    def client
      @client ||= ::Hatena::Bookmark.new(
        consumer_key:    ENV['hatena_consumer_key'],
        consumer_secret: ENV['hatena_consumer_sec'],
        request_token:   ENV['hatena_access_token'],
        request_secret:  ENV['hatena_access_secret']
      )
    end

    def feed_entry
      client.feed['feed']['entry']
    rescue
      []
    end
  end
end
