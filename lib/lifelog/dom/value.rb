class Lifelog
  class Dom::Value
    require 'lifelog/dom/value/twitter'
    require 'lifelog/dom/value/hatena'
    require 'lifelog/dom/value/github'
    require 'lifelog/dom/value/moves'
    require 'lifelog/dom/value/animetick'
    require 'lifelog/dom/value/weather'

    def initialize(response)
      @response = response
    end

    def parse_to_His date
      date.sub(/\d{4}-\d{2}-\d{2}\ /, '').match(/\d{2}:\d{2}/).to_s
    end
  end
end
