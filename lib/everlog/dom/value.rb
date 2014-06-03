class Everlog
  class Dom::Value
    require 'everlog/dom/value/twitter'
    require 'everlog/dom/value/hatena'
    require 'everlog/dom/value/github'
    require 'everlog/dom/value/moves'
    require 'everlog/dom/value/animetick'
    require 'everlog/dom/value/weather'
    require 'everlog/dom/value/footer'

    def initialize(response)
      @response = response
    end

    def parse_to_His date
      date.sub(/\d{4}-\d{2}-\d{2}\ /, '').match(/\d{2}:\d{2}/).to_s
    end
  end
end
