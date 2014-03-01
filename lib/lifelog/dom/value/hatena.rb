class Lifelog
  class Dom::Value::Hatena
    include Maybe

    def initialize response
      @response = response
    end

    def title
      maybe(@response['title']).to_s
    end

    def link
      row_array = maybe(@response['link']).to_h
      maybe(row_array.first['href']).to_s
    end

    def issued
      row_string = maybe(@response['issued']).to_s
      DateTime.parse(row_string).to_time
    rescue ArgumentError
      Time.parse('00:00:00')
    end
  end
end
