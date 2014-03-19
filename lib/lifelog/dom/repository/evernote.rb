class Lifelog
  class Dom::Repository::Evernote < Dom::Repository
    TARGET = 'lifelog'

    def initialize sandbox
      @sandbox = sandbox
    end

    def api_client
      @api_client ||= Inf::Api::Evernote.new(@sandbox)
    end

    def save(title, content)
      api_client.note.notebookGuid = get_guid_forcibly TARGET
      api_client.post_note(title, content)
    end

    def get_guid_forcibly notebook_name
      api_client.notebooks.each {|n| return n.guid if n.name == notebook_name }
      api_client.create_notebook(notebook_name).guid
    end
  end
end
