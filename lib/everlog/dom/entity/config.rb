class Everlog
  class Dom::Entity::Config < Dom::Entity
    THIRD_PARTY = %w(evernote twitter hatena github moves animetick weather googlemap).freeze

    THIRD_PARTY.each do |service|
      const_set service.capitalize, Class.new {
        class << self
          attr_writer :consumer_key
          attr_writer :consumer_secret
          attr_writer :access_token
          attr_writer :access_secret

          def message
            service_name = self.name.split('::').last.downcase
            required_param = caller()[0].match(/`.*'?/).to_s.delete('`\'')
            "#{service_name} #{required_param} is requried."
          end

          def consumer_key
            @consumer_key.nil? ? raise(Everlog::DomainConfigError, message) : @consumer_key
          end

          def consumer_secret
            @consumer_secret.nil? ? raise(Everlog::DomainConfigError, message) : @consumer_secret
          end

          def access_token
            @access_token.nil? ? raise(Everlog::DomainConfigError, message) : @access_token
          end

          def access_secret
            @access_secret.nil? ? raise(Everlog::DomainConfigError, message) : @access_secret
          end
        end
      }
    end

    class << self
      def clear!
        THIRD_PARTY.each do |service|
          const_get(service.to_s.capitalize).access_token = nil
          const_get(service.to_s.capitalize).access_secret = nil
        end
      end

      def method_missing name
        raise NoMethodError, 'specified service is invalid.' unless THIRD_PARTY.include?(name.to_s)
        return const_get(name.to_s.capitalize)
      end
    end
  end

  class DomainConfigError < StandardError; end
end
