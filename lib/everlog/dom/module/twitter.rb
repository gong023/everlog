class Everlog
  class Dom::Module::Twitter < Dom::Module
    def timeline
      Inf::Api::Twitter.new(@config).timeline
    end

    class << self
      def fetch_since date
        tweets = self.new.timeline.map { |r| Dom::Value::Twitter.new(r) if r.created_at > date }
        tweets.compact.reverse
      end
    end
  end
end
