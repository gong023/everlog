class Everlog
  class Dom::Value::Moves::Referer::Place < Dom::Value::Moves::Referer
    def screen_name
      place = Dom::Value::Moves::Place.new(@response)
      Inf::Api::GoogleMap.new.screen_name(place.latitude, place.longitude)
    end
  end
end
