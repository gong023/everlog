require 'pp'
require 'dotenv'
require 'lifelog/twitter'
require 'lifelog/moves'
require 'lifelog/evernote'
require 'lifelog/hatena'
require 'lifelog/github'

Dotenv.load

class Lifelog
  def self.daily
    content = Evernote::Content.new
    content.push(:twitter, Twitter.new.today)
    content.push(:moves, Moves.new.today)
    content.push(:hatena, Hatena.new.today)
    title = "[#{Date.today.to_s}]日記"
    Evernote::Note.new.post(title, content.render)
  end
end
