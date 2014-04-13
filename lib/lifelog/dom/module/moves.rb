class Lifelog
  class Dom::Module::Moves
    def initialize config
      @config = config
    end

    def moves_api
      @moves_api ||= Inf::Api::Moves.new(@config)
    end

    def storyline
      moves_api.daily_storyline.map do |story|
        case story['type']
        when 'place'
          Dom::Value::Moves::Referer::Place.new story
        when 'move'
          Dom::Value::Moves::Referer::Move.new story
        end
      end
    end

    def summary
      Dom::Value::Moves::Summary.new(moves_api.daily_summary)
    end
  end
end
