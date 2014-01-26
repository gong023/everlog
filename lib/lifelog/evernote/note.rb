class Lifelog
  module Evernote
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
  end
end
