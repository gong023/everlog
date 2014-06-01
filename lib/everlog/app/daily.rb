class Everlog
  class Daily < App
    def initialize
      @content = Dom::Entity::Aggregate::DailyReport.new
    end

    def push(service, option = {})
      @content.push(service, option)
    end

    def publish(title, access_token = nil, output = 'local')
      @content.publish(title, access_token, output)
    end
  end
end
