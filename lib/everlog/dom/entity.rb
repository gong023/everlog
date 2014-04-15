class Everlog
  class Dom::Entity
    require 'everlog/dom/entity/content'
    require 'everlog/dom/entity/config'
    attr_reader :id

    def initialize id = 0
      @id = id
    end
  end
end
