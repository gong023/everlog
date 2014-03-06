class Lifelog
  class Dom::Value::Moves::Summary
    include Maybe

    def initialize response
      @response = response
    end

    def walk
      maybe(pick('wlk'))['distance'].to_f / 1000
    end

    def cycle
      maybe(pick('cyc'))['distance'].to_f / 1000
    end

    def transport
      maybe(pick('trp'))['distance'].to_f / 1000
    end

    def cal
      @response.map {|r| maybe(r["calories"]).to_i }.inject(:+)
    end

    private
    def pick activity
      @response.each { |r| return r if r['activity'] == activity }
      nil
    end
  end
end
