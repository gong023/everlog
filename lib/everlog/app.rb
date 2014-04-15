class Everlog
  class App
    require 'everlog/app/twitter'
    require 'everlog/app/hatena'
    require 'everlog/app/github'
    require 'everlog/app/moves'
    require 'everlog/app/animetick'
    require 'everlog/app/weather'
    require 'everlog/app/evernote'

    def self.fetch_since
      raise 'no implemented.'
    end
  end
end
