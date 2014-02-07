require 'pp'
require 'dotenv'
require 'lifelog/twitter'
require 'lifelog/moves'
require 'lifelog/evernote'

Dotenv.load

class Lifelog
  def self.daily
    content = Evernote::Content.new
    content.push(:twitter, Twitter.new.today)
    content.push(:moves, Moves.new.today)
    title = "日記/#{Date.today.to_s}"
    Evernote::Note.new.post(title, content.render)
  end
end
