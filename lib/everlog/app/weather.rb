class Everlog
  class App::Weather < App
    def self.fetch_since(date)
      config = Dom::Entity::Config.wunderground
      api_response = Inf::Api::Wunderground.new(config).yesterday('Tokyo')
      Dom::Value::Weather.new(api_response)
    end
  end
end
