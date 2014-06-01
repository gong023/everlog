class Everlog
  class Inf::Api::Moves < Inf::Api
    require 'moves'

    def client
      @client ||= ::Moves::Client.new(ENV['moves_access_token'])
    end

    def daily_summary(from = (Date.today - 1), to = Date.today)
      client.daily_summary(from..to).first['summary']
    rescue => e
      raise InfrastructureMovesError, "daily_summary error / #{e.message}"
    end

    def daily_storyline(from = (Date.today - 1), to = Date.today)
      client.daily_storyline(from..to).first['segments']
    rescue => e
      raise InfrastructureMovesError, "daily_storyline error / #{e.message}"
    end
  end

  class InfrastructureMovesError < StandardError; end
end
