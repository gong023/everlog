class Everlog
  class Inf::Api::Evernote < Inf::Api
    require 'evernote_oauth'

    def initialize(is_sandbox, config)
      @is_sandbox = is_sandbox
      @config = config
    end

    def client
      @client ||= EvernoteOAuth::Client.new(token: @config.access_secret, sandbox: @is_sandbox)
    end

    def note
      @note ||= ::Evernote::EDAM::Type::Note.new
    end

    def notebook
      @notebook ||= ::Evernote::EDAM::Type::Notebook.new
    end

    def post_note(title, content)
      note.title = title
      note.content = content
      client.note_store.createNote(@config.access_secret, note)
    rescue => e
      raise EverlogInfrastructureEvernoteError, "post note error / class:#{e.class} code:#{e.errorCode}"
    end

    def create_notebook title
      notebook.name = title
      client.note_store.createNotebook notebook
    rescue => e
      raise EverlogInfrastructureEvernoteError, "create_notebook error / class:#{e.class} code:#{e.errorCode}"
    end

    def notebooks
      client.note_store.listNotebooks
    rescue => e
      raise EverlogInfrastructureEvernoteError, "notebooks error / class:#{e.class} code:#{e.errorCode}"
    end
  end

  class EverlogInfrastructureEvernoteError < StandardError; end
end
