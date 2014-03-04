class Lifelog
  class Inf::Api::Evernote < Inf::Api
    require 'evernote_oauth'

    def initialize sandbox
      @sandbox = sandbox
    end

    def token
      @sandbox ? ENV['evernote_sandbox_access_token'] : ENV['evernote_access_token']
    end

    def client
      @client ||= EvernoteOAuth::Client.new(token: token, sandbox: @sandbox)
    end

    def note
      @note ||= ::Evernote::EDAM::Type::Note.new
    end

    def post_note(title, content)
      note.title = title
      note.content = content
      client.note_store.createNote(token, note)
    end
  end
end
