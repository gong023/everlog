class Lifelog
  module Evernote
    class Content
      require 'erb'

      TEMPLATED = ['tweet'].freeze

      def push(name, value)
        instance_variable_set("@#{name}", value)
      end

      def render
        validate_before_render
        template = File.open(File.dirname(__FILE__) + '/content.erb').read.delete("\n")
        ERB.new(template).result(binding)
      end

      def validate_before_render
        TEMPLATED.each do |need_templated|
          in_instance = instance_variable_get("@#{need_templated}")
          instance_variable_set("@#{need_templated}", ['no-data']) if in_instance.nil? || in_instance.empty?
        end
        instance_variables
      end
    end
  end
end
