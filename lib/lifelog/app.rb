class Lifelog
  class App
    require 'lifelog/app/twitter'
    require 'lifelog/app/hatena'
    require 'lifelog/app/github'
    require 'lifelog/app/moves'
    require 'lifelog/app/animetick'

    def self.fetch_since
      raise 'no implemented.'
    end
  end
end
