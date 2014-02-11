class Lifelog
  class Hatena
    require 'hatena-bookmark'

    def client
      @client ||= ::Hatena::Bookmark.new(
        consumer_key:    ENV['hatena_consumer_key'],
        consumer_secret: ENV['hatena_consumer_sec'],
        request_token:   ENV['hatena_access_token'],
        request_secret:  ENV['hatena_access_secret']
      )
    end

    def today
      one_day_ago = (DateTime.now - 1).to_time
      client.feed['feed']['entry'].inject([]) do |result, feed|
        result << { 'title' => feed['title'], 'link' => feed['link'].first['href'] } if pick_time(feed['issued']) > one_day_ago
        result
      end.compact
    end

    private
    def pick_time response
      DateTime.parse(response).to_time
    end
  end
end
