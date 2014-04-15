class Everlog
  class Inf::Api::Moves < Inf::Api
    require 'moves'

    def client
      @client ||= ::Moves::Client.new(ENV['moves_access_token'])
    end

    def daily_summary(from = (Date.today - 1), to = Date.today)
      client.daily_summary(from..to).first['summary']
    rescue
      []
    end

    def daily_storyline(from = (Date.today - 1), to = Date.today)
      client.daily_storyline(from..to).first['segments']
    rescue
      []
    end
  end
end
