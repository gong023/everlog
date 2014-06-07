class Everlog
  class Dom::Module::Evernote < Dom::Module
    def initialize is_sandbox
      @is_sandbox = is_sandbox
      super()
    end

    def save(title, content)
      Dom::Repository::Evernote.new(@is_sandbox, @config).save(title, content)
    end

    class << self
      def publish(title, content, output)
        is_sandbox = output != 'production'
        self.new(is_sandbox).save(title, content)
      end
    end
  end
end
