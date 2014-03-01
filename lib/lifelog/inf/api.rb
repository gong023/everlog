class Lifelog
  class Inf::Api
    require 'lifelog/inf/api/twitter'
    require 'lifelog/inf/api/hatena'

    def client
      raise 'no implemented.'
    end
  end
end
