class Everlog
  class Inf::Api::Wunderground < Inf::Api
    require 'wunderground'

    def client
      @client ||= Wunderground.new(@config.access_secret, throws_exceptions: true)
    end

    def yesterday place
      client.yesterday_for(place)['history']
    rescue
      nil
    end
  end
end
