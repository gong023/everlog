require 'pp'
require 'dotenv'
require 'lifelog/nullobject'
require 'lifelog/inf'
require 'lifelog/dom'
require 'lifelog/app'

require 'lifelog/moves'
require 'lifelog/evernote'
require 'lifelog/hatena'
require 'lifelog/github'

Dotenv.load

class Lifelog
  def self.daily
    content = Evernote::Content.new
    content.push(:twitter, App::Twitter.today)
    content.push(:moves, Moves.new.today)
    content.push(:hatena, Hatena.new.today)
    content.push(:github, Github.new.today)
    title = "[#{Date.today.to_s}]日記"
    Evernote::Note.new.post(title, content.render)
  end
end
