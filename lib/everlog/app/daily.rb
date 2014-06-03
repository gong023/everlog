class Everlog
  class Daily
    def initialize
      @content = Dom::Entity::Aggregate::DailyReport.new
    end

    def push(service, option = {})
      @content.push(service, option)
    end

    def footer phrase
      @content.footer(phrase)
    end

    def publish(title, access_token = nil, output = 'local')
      @content.publish(title, access_token, output)
    end
  end
end
