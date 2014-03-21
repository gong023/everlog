class Lifelog
  class Inf::Api
    require 'lifelog/inf/api/twitter'
    require 'lifelog/inf/api/hatena'
    require 'lifelog/inf/api/github'
    require 'lifelog/inf/api/evernote'
    require 'lifelog/inf/api/googlemap'
    require 'lifelog/inf/api/moves'
    require 'lifelog/inf/api/animetick'
    require 'lifelog/inf/api/wunderground'

    def client
      raise 'no implemented.'
    end
  end
end
