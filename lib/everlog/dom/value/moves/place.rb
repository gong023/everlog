class Everlog
  class Dom::Value::Moves::Place < Dom::Value::Moves
    include Maybe

    def latitude
      maybe(@response['place'])['location']['lat'].to_s
    end

    def longitude
      maybe(@response['place'])['location']['lon'].to_s
    end
  end
end
