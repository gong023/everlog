class Everlog
  class Inf::Api::Twitter < Inf::Api
    require 'twitter'

    def client
      @client ||= ::Twitter::REST::Client.new do |config|
        config.consumer_key        = @config.consumer_key
        config.consumer_secret     = @config.consumer_secret
        config.access_token        = @config.access_token
        config.access_token_secret = @config.access_secret
      end
    end

    def timeline
      client.user_timeline(screen_name, { count: 200 })
    rescue => e
      raise InfrastructureTwitterError, "timeline error / #{e.message}"
    end

    def screen_name
      client.user.screen_name
    rescue => e
      raise InfrastructureTwitterError, "screen_name error / #{e.message}"
    end
  end

  class InfrastructureTwitterError < StandardError; end
end
