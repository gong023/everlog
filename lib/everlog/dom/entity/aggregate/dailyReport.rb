class Everlog
  class Dom::Entity::Aggregate
    class DailyReport < Dom::Entity
      def initialize
        @content = Content.new
      end

      def push(service, option)
        setup_config(service.to_sym, option)
        data = Dom::Module.const_get(service.capitalize).fetch_since((DateTime.now - 1).to_time)
        @content.push(service, data)
      ensure
        Config.clear!
      end

      def publish(title, access_token, output)
        return @content.render if output == 'local'
        raise EverlogConfigError, 'evernote access_token not given' if access_token.nil?

        Config.evernote.access_secret = access_token
        App::Evernote.publish(title, @content.render, output)
      ensure
        Config.clear!
      end

      private
      def setup_config(service, option)
        case service
        when :weather
          Config.wunderground.access_token = option[:access_token]
        else
          Config.send(service).consumer_key    = option[:consumer_key]
          Config.send(service).consumer_secret = option[:consumer_secret]
          Config.send(service).access_token    = option[:access_token]
          Config.send(service).access_secret   = option[:access_secret]
        end
      end
    end
  end

  class EverlogConfigError < StandardError; end
end
