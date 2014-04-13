require 'pp'
require 'dotenv'
require 'lifelog/inf'
require 'lifelog/dom'
require 'lifelog/app'

Dotenv.load

class Lifelog
  def self.daily(output = 'local')
    one_day_ago = (DateTime.now - 1).to_time

    content = Dom::Entity::Content.new
    content.push(:weather, App::Weather.yesterday)
    content.push(:twitter, App::Twitter.fetch_since(one_day_ago))
    content.push(:hatena, App::Hatena.fetch_since(one_day_ago))
    content.push(:github, App::Github.fetch_since(one_day_ago))
    content.push(:moves, App::Moves.fetch_since(one_day_ago))
    content.push(:animetick, App::Animetick.fetch_since(one_day_ago))

    if output == 'local'
      puts content.render
    else
      is_evernote_sandbox = output == 'evernote_sandbox'
      evernote_repository = Dom::Repository::Evernote.new(is_evernote_sandbox)
      title = "Lifelog #{(Date.today - 1).to_s.gsub(/-/, '/')}"
      evernote_repository.save(title, content.render)
    end
  end

  def self.upload_sample
    sample = File.open(File.dirname(__FILE__) + '/template_sample.html').read
    Dom::Repository::Evernote.new(true).save("Sample Html", sample)
  end

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

    is_evernote_sandbox = output != 'production'
    Dom::Entity::Config.evernote.access_token = access_token
    Dom::Repository::Evernote.new(is_evernote_sandbox).save(title, @content.render)
  ensure
    Dom::Entity::Config.clear!
  end

  private
  def setup_config(service, option)
    case service
    when :weather
      Dom::Entity::Config.wunderground.access_token = option[:access_token]
    when :moves
      Dom::Entity::Config.moves.access_token = option[:moves_access_token]
      Dom::Entity::Config.googlemap.access_token = option[:googlemap_access_token]
    else
      Dom::Entity::Config.send(service).access_token = option[:access_token]
      Dom::Entity::Config.send(service).access_secret = option[:access_secret]
    end
  end

  class LifelogConfigError < StandardError; end
end
