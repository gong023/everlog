class Lifelog
  class Inf::Api
    require 'lifelog/inf/api/twitter'
    require 'lifelog/inf/api/hatena'
    require 'lifelog/inf/api/github'
    require 'lifelog/inf/api/evernote'

    def client
      raise 'no implemented.'
    end
  end
end
