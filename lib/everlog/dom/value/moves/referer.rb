class Everlog
  class Dom::Value::Moves::Referer < Dom::Value::Moves
    require 'everlog/dom/value/moves/referer/place'
    require 'everlog/dom/value/moves/referer/move'

    def name
      self.class.name.split('::').last.downcase
    end
  end
end
