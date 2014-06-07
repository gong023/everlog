class Everlog
  class Dom::Module
    require 'everlog/dom/module/github'
    require 'everlog/dom/module/moves'
    require 'everlog/dom/module/twitter'
    require 'everlog/dom/module/hatena'
    require 'everlog/dom/module/animetick'
    require 'everlog/dom/module/weather'
    require 'everlog/dom/module/evernote'

    def initialize
      service = self.class.name.split('::').last.downcase
      @config = Dom::Entity::Config.send(service)
    end
  end
end
