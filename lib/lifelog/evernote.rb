class Lifelog
  module Evernote
    require 'evernote_oauth'
    require 'lifelog/evernote/note'
    require 'lifelog/evernote/content'

    def client
      @client ||= EvernoteOAuth::Client.new(token: ENV['evernote_access_token'])
    end
  end
end
