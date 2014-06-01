class Everlog
  class Inf::Api::GoogleMap
    require 'geocoder'

    def initialize
      Geocoder.configure(language: :ja, units: :km)
    end

    def screen_name(lat, lon)
      Geocoder.search("#{lat},#{lon}").first.formatted_address
    rescue => e
      raise InfrastructureGoogleMapError, "screen_name error / #{e.message}"
    end
  end

  class InfrastructureGoogleMapError < StandardError; end
end
