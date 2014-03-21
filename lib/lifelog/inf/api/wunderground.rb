class Lifelog
  class Inf::Api::Wunderground
    require 'wunderground'

    def client
      @client ||= Wunderground.new(ENV['wunderground_token'], throws_exceptions: true)
    end

    def yesterday place
      client.yesterday_for(place)['history']
    rescue
      nil
    end
  end
end
