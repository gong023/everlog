class Everlog
  class Dom::Value::Hatena < Dom::Value
    include Maybe

    def title
      maybe(@response['title']).to_s
    end

    def link
      @response['link'].first['href']
    end

    def issued
      row_string = maybe(@response['issued']).to_s
      DateTime.parse(row_string).to_time
    rescue ArgumentError
      Time.parse('00:00:00')
    end
  end
end
