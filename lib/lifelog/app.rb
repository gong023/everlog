class Lifelog
  class App
    require 'lifelog/app/twitter'
    require 'lifelog/app/hatena'

    def self.fetch_since
      raise 'no implemented.'
    end
  end
end
