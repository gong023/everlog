class Everlog
  class App::Moves
    def self.fetch_since(one_day_ago)
      config = Dom::Entity::Config.moves
      moves_module = Dom::Module::Moves.new(config)
      { summary: moves_module.summary, storyline: moves_module.storyline }
    end
  end
end
