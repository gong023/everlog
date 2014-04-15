class Everlog
  class NullObject
    def method_missing(*args, &block)
      self
    end

    def to_a; []; end
    def to_s; ''; end
    def to_i; 0; end
    def to_f; 0.0; end
  end

  module Maybe
    def maybe value
      value.nil? ? NullObject.new : value
    end
  end
end
