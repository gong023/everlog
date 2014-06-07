class Everlog
  class Dom::Module::Hatena < Dom::Module
    def feed_entry
      Inf::Api::Hatena.new(@config).feed_entry
    end

    class << self
      def fetch_since date
        self.new.feed_entry.map do |r|
          feed = Dom::Value::Hatena.new(r)
          feed.issued > date ? feed : nil
        end.compact
      end
    end
  end
end
