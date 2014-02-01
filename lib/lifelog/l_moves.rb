require 'moves'

class Lifelog
  class Moves

    def client
      ::Moves::Client.new(ENV['moves_access_token'])
    end

    def today
      client.daily_storyline
    end

    def summary
      api_result = client.daily_summary.first
      walk = cycle = trp = cal = 0

      api_result['summary'].each do |k|
        if k['activity'] == 'wlk'
          walk = k['distance']
        end
        if k['activity'] == 'cyc'
          cycle = k['distance']
        end
        if k['activity'] == 'trp'
          trp = k['distance']
        end
        cal += k['calories'] unless k['calories'].nil?
      end

      {
        summary: {
          cal: cal,
          walk: walk,
          cycle: cycle,
          trp: trp
        }
      }
    end
  end
end
