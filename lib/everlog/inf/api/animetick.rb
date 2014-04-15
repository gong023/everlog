class Everlog
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
        req['Cookie'] = "_animetick_session=#{@config.access_token}"
        req['X-CSRF-Token'] = @config.access_secret
      end

      JSON.parse(response.body)
    end
  end
end
