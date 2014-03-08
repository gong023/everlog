class Lifelog
  class Dom::Value::Moves::Referer < Dom::Value::Moves
    require 'lifelog/dom/value/moves/referer/place'
    require 'lifelog/dom/value/moves/referer/move'

    def name
      self.class.name.split('::').last.downcase
    end
  end
end
