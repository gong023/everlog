class Everlog
  class Dom::Value::Moves::Referer::Move < Dom::Value::Moves::Referer
    def to_a
      @response['activities'].map { |s| Dom::Value::Moves::Move.new(s) }
    end
  end
end
