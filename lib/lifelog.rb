require 'pp'
require 'dotenv'
require 'lifelog/inf'
require 'lifelog/dom'
require 'lifelog/app'

Dotenv.load

class Lifelog
  def self.daily(dry = true, evernote_sandbox = true)
    one_day_ago = (DateTime.now - 1).to_time

    content = Dom::Entity::Content.new
    content.push(:twitter, App::Twitter.fetch_since(one_day_ago))
    content.push(:hatena, App::Hatena.fetch_since(one_day_ago))
    content.push(:github, App::Github.fetch_since(one_day_ago))
    content.push(:moves, App::Moves.fetch_since(one_day_ago))
    content.push(:animetick, App::Animetick.fetch_since(one_day_ago))

    if to_boolean(dry)
      puts content.render
    else
      evernote_repository = Dom::Repository::Evernote.new(to_boolean(evernote_sandbox))
      evernote_repository.save("[#{Date.today}]日記", content.render)
    end
  end

  # XXX
  def self.to_boolean str
    str == 'true'
  end
end
