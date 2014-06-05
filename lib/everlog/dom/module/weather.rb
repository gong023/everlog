class Everlog
  class Dom::Module::Weather < Dom::Module
    def self.fetch_since(date)
      config = Dom::Entity::Config.weather
      api_response = Inf::Api::Wunderground.new(config).yesterday('Tokyo')
      Dom::Value::Weather.new(api_response)
    end
  end
end
