class Lifelog
  module Evernote
    class Content
      require 'erb'
      require 'pathname'

      def push(name, value)
        value = [] if value.nil?
        instance_variable_set("@#{name}", value)
      end

      def render
        validate_before_render
        template = File.open(File.dirname(__FILE__) + '/en-note.erb').read.delete("\n")
        ERB.new(template).result(binding)
      end

      def validate_before_render
      end
    end
  end
end
