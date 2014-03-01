class Lifelog
  class Dom::Value::Twitter
    include Maybe

    def initialize(response)
      @response = response
    end

    def tweet
      maybe(@response.text).to_s
    end
  end
end
