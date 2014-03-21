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
      evernote_repository.save("[#{Date.today}]日記", content.render)
    end
  end

  def self.upload_sample
    sample = File.open(File.dirname(__FILE__) + '/template_sample.html').read
    Dom::Repository::Evernote.new(true).save("Sample Html", sample)
  end
end
