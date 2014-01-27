require 'moves'

class Lifelog
  class Moves

    def client
      ::Moves::Client.new(ENV['moves_access_token'])
    end

    def today
      client.daily_storyline
    end

    def parse_to_markdown response
      response.pop['segments'].each do |r|
        if r["type"] === "place"
        elsif r["type"] === "move"
        end
      end
    end
  end
end
