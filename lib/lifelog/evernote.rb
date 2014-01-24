class Lifelog
  module Evernote
    require 'evernote_oauth'
    def client
      @client ||= EvernoteOAuth::Client.new(token: ENV['evernote_access_token'])
    end

    class Note
      include Evernote

      def note
        @note ||= ::Evernote::EDAM::Type::Note.new
      end

      def post(title, content)
        note.title = title
        note.content = content
        client.note_store.createNote(ENV['evernote_access_token'], note)
      end
    end

    class Content
      def header
        "<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE en-note SYSTEM 'http://xml.evernote.com/pub/enml2.dtd'>"
      end

      def push(tag, article)
        article = tagged[tag] + article if tagged.has_key?(tag)
        tagged.store(tag, article)
        tagged
      end

      def tagged
        @tagged ||= {}
      end

      def dump
        body = tagged.map {|k, v| "<#{k}>#{v}</#{k}>" }.pop
        "#{header}#{body}"
      end
    end
  end
end
