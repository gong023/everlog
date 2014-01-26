class Lifelog
  module Evernote
    require 'evernote_oauth'
    require 'note'
    require 'content'

    def client
      @client ||= EvernoteOAuth::Client.new(token: ENV['evernote_access_token'])
    end
  end
end
