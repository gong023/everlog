class Everlog
  class Inf::Api
    require 'everlog/inf/api/twitter'
    require 'everlog/inf/api/hatena'
    require 'everlog/inf/api/github'
    require 'everlog/inf/api/evernote'
    require 'everlog/inf/api/googlemap'
    require 'everlog/inf/api/moves'
    require 'everlog/inf/api/animetick'
    require 'everlog/inf/api/wunderground'

    def initialize config
      @config = config
    end

    def client
      raise 'no implemented.'
    end
  end
end
