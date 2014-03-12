class Lifelog
  class App::Animetick < App
    def self.fetch_since date
      api_response = Inf::Api::Animetick.new.ticket_list
      tickets = api_response.map do |r|
        ticket = Dom::Value::Animetick.new(r)
        ticket.updated_at > date ? ticket : nil
      end
      tickets.compact
    end
  end
end
