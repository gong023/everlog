class Everlog
  class Dom::Module::Animetick < Dom::Module
    def ticket_list
      Inf::Api::Animetick.new(@config).ticket_list
    end

    class << self
      def fetch_since date
        self.new.ticket_list.map do |r|
          ticket = Dom::Value::Animetick.new(r)
          ticket.updated_at > date ? ticket : nil
        end.compact
      end
    end
  end
end
