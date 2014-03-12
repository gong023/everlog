class Lifelog
  class Inf::Api::Animetick < Inf::Api
    require 'faraday'

    def client
      @client ||= Faraday.new(url: 'http://animetick.net')
    end

    def ticket_list
      request(:get, '/ticket/list.json', { watched: true })['list']
    rescue
      []
    end

    private
    def request(method, endpoint, params = {})
      response = client.send(method, endpoint, params) do |req|
        req['Cookie'] = "_animetick_session=#{ENV['animetick_session']}"
        req['X-CSRF-Token'] = ENV['animetick_csrf_token']
      end

      JSON.parse(response.body)
    end
  end
end
