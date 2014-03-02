class Lifelog
  class Dom::Value::Github::Commit
    include Maybe

    def initialize response
      @response = response
    end

    def url
      maybe(@response.rels[:html].href).to_s
    end

    def message
      maybe(@response.commit[:message]).to_s
    end
  end
end
