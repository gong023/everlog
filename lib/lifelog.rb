require 'pp'
require 'dotenv'
require 'lifelog/nullobject'
require 'lifelog/inf'
require 'lifelog/dom'
require 'lifelog/app'

require 'lifelog/moves'
require 'lifelog/evernote'
require 'lifelog/github'

Dotenv.load

class Lifelog
  def self.daily
    one_day_ago = (DateTime.now - 1).to_time
    content = Evernote::Content.new
    content.push(:twitter, App::Twitter.fetch_since(one_day_ago))
    content.push(:moves, Moves.new.today)
    content.push(:hatena, App::Hatena.fetch_since(one_day_ago))
    content.push(:github, Github.new.today)
    title = "[#{Date.today.to_s}]日記"
    Evernote::Note.new.post(title, content.render)
  end
end
