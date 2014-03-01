class Lifelog
  module Evernote
    class Content
      require 'erb'

      def push(name, value)
        instance_variable_set("@#{name}", value)
      end

      def render
        template = File.open(File.dirname(__FILE__) + '/content.erb').read.delete("\n")
        ERB.new(template).result(binding)
      end
    end
  end
end
