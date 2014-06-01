require 'everlog/inf'
require 'everlog/dom'
require 'everlog/app'

class Everlog
  def initialize
    @dailyReport = Dom::Entity::Aggregate::DailyReport.new
  end

  def push_daily_report(service, option = {})
    @dailyReport.push(service, option)
  end

  def publish_daily_report(title, access_token = nil, output = 'local')
    @dailyReport.publish(title, access_token, output)
  end
end
