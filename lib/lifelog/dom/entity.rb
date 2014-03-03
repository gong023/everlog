class Lifelog
  class Dom::Entity
    require 'lifelog/dom/entity/content'
    attr_reader :id

    def initialize id = 0
      @id = id
    end
  end
end
