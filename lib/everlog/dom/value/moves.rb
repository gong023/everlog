class Everlog
  class Dom::Value::Moves < Dom::Value
    require 'everlog/dom/value/moves/summary'
    require 'everlog/dom/value/moves/place'
    require 'everlog/dom/value/moves/move'
    require 'everlog/dom/value/moves/referer'

    def round_off float
      "%.1f" % float
    end

    def km
      1000
    end
  end
end
