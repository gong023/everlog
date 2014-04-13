class Lifelog
  class Dom::Entity
    require 'lifelog/dom/entity/content'
    require 'lifelog/dom/entity/config'
    attr_reader :id

    def initialize id = 0
      @id = id
    end
  end
end
