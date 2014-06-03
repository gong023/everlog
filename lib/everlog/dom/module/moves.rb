class Everlog
  class Dom::Module::Moves < Dom::Module
    def initialize config
      @config = config
    end

    def api_client
      @api_client ||= Inf::Api::Moves.new(@config)
    end

    def storyline
      api_client.daily_storyline.map do |story|
        case story['type']
        when 'place'
          Dom::Value::Moves::Referer::Place.new story
        when 'move'
          Dom::Value::Moves::Referer::Move.new story
        end
      end
    end

    def summary
      Dom::Value::Moves::Summary.new(api_client.daily_summary)
    end

    class << self
      # date対応してない
      def fetch_since date
        instance = self.new(Dom::Entity::Config.moves)
        { summary: instance.summary, storyline: instance.storyline }
      end
    end
  end
end
