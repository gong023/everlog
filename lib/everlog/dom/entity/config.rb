class Everlog
  class Dom::Entity::Config < Dom::Entity
    THIRD_PARTY = %w(evernote twitter hatena github moves animetick weather googlemap).freeze

    THIRD_PARTY.each do |service|
      const_set service.capitalize, Class.new {
        class << self
          attr_accessor :consumer_key
          attr_accessor :consumer_secret
          attr_accessor :access_token
          attr_accessor :access_secret
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
end
