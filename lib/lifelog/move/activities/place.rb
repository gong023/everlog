class Lifelog
  class Moves
    class Place
      require 'geocoder'

      def initialize table
        @table = table
        Geocoder.configure(language: :ja, units: :km)
      end

      def screen_name
        api_result = Geocoder.search("#{@table['location']['lat']},#{@table['location']['lon']}")
        name = ''; 2.times { |i| name += "#{api_result[i].formatted_address} / " }
        name
      end
    end
  end
end
