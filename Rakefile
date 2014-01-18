task default: :post_daily

class Lifelog
  def self.daily

  end

  module Setting
    require 'yaml'
    def file
      if ENV['test']
        yml = 'test_setting.yml'
      else
        yml = 'setting.yml'
      end
      YAML.load_file(File.dirname(__FILE__) + yml)
    end

    def load
    end
  end

  class Evernote
    include Setting
    require 'evernote_oauth'
    def client
      @client ||= EvernoteOAuth::Client.new(token: setting['access_token'])
    end

    def setting
    end

    class Note < Evernote
      def initialize
        @note = Evernote::EDAM::Type::Note.new
      end

      def content
        @content ||= header
      end

      def header
        "<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE en-note SYSTEM 'http://xml.evernote.com/pub/enml2.dtd'>"
      end

      def post
        client.note_store.createNote(setting['access_token'], @note)
      end

      def push(tag, article)
        "#{content}<#{tag}>#{article}</#{tag}>"
      end
    end
  end

  class Twitter
    include Setting
    require 'twitter'
    def client
    end

    def setting
    end
  end

  class Moves
    include Setting
    def client
    end

    def setting
    end
  end
end

task :post_daily do
  $:.push File.dirname(__FILE__)
  require 'pp'
end
