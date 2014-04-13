require 'lifelog/inf'
require 'lifelog/dom'
require 'lifelog/app'

class Lifelog
  def initialize
    @content = Dom::Entity::Content.new
  end

  def push(service, option = {})
    setup_config(service.to_sym, option)
    data = App.const_get(service.capitalize).fetch_since((DateTime.now -1).to_time)
    @content.push(service, data)
  ensure
    Dom::Entity::Config.clear!
  end

  def publish(title, access_token = nil, output = 'local')
    return @content.render if output == 'local'
    raise LifelogConfigError, 'evernote access_token not given' if access_token.nil?

    Dom::Entity::Config.evernote.access_token = access_token
    Dom::App::Evernote.publish(title, @content.render, output)
  ensure
    Dom::Entity::Config.clear!
  end

  private
  def setup_config(service, option)
    case service
    when :weather
      Dom::Entity::Config.wunderground.access_token = option[:access_token]
    else
      Dom::Entity::Config.send(service).consumer_key    = option[:consumer_key]
      Dom::Entity::Config.send(service).consumer_secret = option[:consumer_secret]
      Dom::Entity::Config.send(service).access_token    = option[:access_token]
      Dom::Entity::Config.send(service).access_secret   = option[:access_secret]
    end
  end

  class LifelogConfigError < StandardError; end
end
