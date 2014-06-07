class Everlog
  class Dom::Module::Weather < Dom::Module
    def yesterday
      Inf::Api::Wunderground.new(@config).yesterday('Tokyo')
    end

    class << self
      def fetch_since(date)
        api_response = self.new.yesterday
        Dom::Value::Weather.new(api_response)
      end
    end
  end
end
