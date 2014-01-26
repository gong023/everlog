require 'pp'
require 'dotenv'
require 'article'
require 'l_twitter'
require 'l_moves'
require 'evernote'

Dotenv.load

class Lifelog
  def self.daily
    content = Evernote::Content.new
    content.push(:tweet, Twitter.new.today)
    Evernote::Note.new.post(title, content.render)
  end
end
