class Lifelog
  class Inf::Api::Evernote < Inf::Api
    require 'evernote_oauth'

    def client
      @client ||= EvernoteOAuth::Client.new(token: ENV['evernote_access_token'], sandbox: false)
    end

    def note
      @note ||= ::Evernote::EDAM::Type::Note.new
    end

    def post_note(title, content)
      note.title = title
      note.content = content
      client.note_store.createNote(ENV['evernote_access_token'], note)
    end
  end
end
