class Everlog
  class Inf::Api::Hatena < Inf::Api
    require 'hatena-bookmark'

    def client
      @client ||= ::Hatena::Bookmark.new(
        consumer_key:    @config.consumer_key,
        consumer_secret: @config.consumer_secret,
        request_token:   @config.access_token,
        request_secret:  @config.access_secret
      )
    end

    def feed_entry
      client.feed['feed']['entry']
    rescue
      []
    end
  end
end
