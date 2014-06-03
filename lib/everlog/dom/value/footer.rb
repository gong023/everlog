class Everlog
  class Dom::Value::Footer < Dom::Value
    include Maybe

    def initialize phrase
      @phrase = phrase
    end

    def phrase
      maybe(@phrase).to_s
    end
  end
end
