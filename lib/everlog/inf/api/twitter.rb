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
      raise EverlogInfrastructureTwitterError, "timeline error / #{e.message}"
    end

    def screen_name
      client.user.screen_name
    rescue => e
      raise EverlogInfrastructureTwitterError, "screen_name error / #{e.message}"
    end
  end

  class EverlogInfrastructureTwitterError < StandardError; end
end
