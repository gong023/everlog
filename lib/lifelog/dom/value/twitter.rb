class Lifelog
  class Dom::Value::Twitter < Dom::Value
    include Maybe

    def tweet
      maybe(@response).text.to_s
    end

    def created_at
      parse_to_His(maybe(@response).created_at.to_s)
    end
  end
end
