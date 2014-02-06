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
        name = ''; 2.times { |i| name += "#{api_result[i].formatted_address} / " }
        name
      end
    end
  end
end
