class Everlog
  class Inf::Api::Wunderground < Inf::Api
    require 'wunderground'

    def initialize config
      super(config)
      @cache = Inf::Cache::File::Wunderground.new
    end

    def client
      @client ||= ::Wunderground.new(@config.access_token, throws_exceptions: true)
    end

    def yesterday place
      @cache.delete((Date.today - 2).to_s)
      response = @cache.create((Date.today - 1).to_s, { place: place, client: client}) do |args|
        args[:client].yesterday_for(args[:place]).to_json
      end
      JSON.parse(response)['history']
    rescue => e
      raise InfrastructureWeatherError, "yesterday error / #{e.message}"
    end

    class InfrastructureWeatherError < StandardError; end
  end
end
