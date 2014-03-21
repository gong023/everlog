class Lifelog
  class App::Weather < App
    def self.yesterday
      api_response = Inf::Api::Wunderground.new.yesterday('Tokyo')
      Dom::Value::Weather.new(api_response)
    end
  end
end
