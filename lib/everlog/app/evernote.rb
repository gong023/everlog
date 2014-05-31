class Everlog
  class App::Evernote < App
    def self.publish(title, content, output)
      config = Dom::Entity::Config.evernote
      is_sandbox = output != 'production'
      Dom::Repository::Evernote.new(is_sandbox, config).save(title, content)
    end
  end
end
