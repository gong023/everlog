class Lifelog
  class App::Moves
    def self.fetch_since(one_day_ago)
      moves_module = Dom::Module::Moves.new
      { summary: moves_module.summary, storyline: moves_module.storyline }
    end
  end
end
