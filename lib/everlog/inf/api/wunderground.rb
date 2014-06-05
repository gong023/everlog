class Everlog
  class Inf::Api::Wunderground < Inf::Api
    require 'wunderground'

    def client
      @client ||= ::Wunderground.new(@config.access_token, throws_exceptions: true)
    end

    def yesterday place
      client.yesterday_for(place)['history']
    rescue => e
      raise InfrastructureWeatherError, "yesterday error / #{e.message}"
    end

    class InfrastructureWeatherError < StandardError; end
  end
end
