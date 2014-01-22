class Lifelog
  class Evernote
    include Setting
    require 'evernote_oauth'
    def client
      @client ||= EvernoteOAuth::Client.new(token: setting['access_token'])
    end

    def setting
    end

    class Note < Evernote
      def initialize
        @note = Evernote::EDAM::Type::Note.new
      end

      def content
        @content ||= header
      end

      def header
        "<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE en-note SYSTEM 'http://xml.evernote.com/pub/enml2.dtd'>"
      end

      def post
        client.note_store.createNote(setting['access_token'], @note)
      end

      def push(tag, article)
        "#{content}<#{tag}>#{article}</#{tag}>"
      end
    end
  end
end
