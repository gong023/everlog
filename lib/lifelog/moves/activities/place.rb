class Lifelog
  class Moves
    class Place < Activity
      require 'geocoder'

      def initialize table
        super
        Geocoder.configure(language: :ja, units: :km)
      end

      def screen_name
        api_result = Geocoder.search("#{@table['place']['location']['lat']},#{@table['place']['location']['lon']}")
        api_result.first.formatted_address
      end
    end
  end
end
