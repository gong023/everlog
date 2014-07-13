class Everlog
  class Inf::Cache::File < Inf::Cache
    require 'LocalFileCache'
    require 'everlog/inf/cache/file/wunderground'
    require 'pry'

    def initialize
      service = self.class.name.split('::').last.downcase
      @cache = LocalFileCache.new("#{::File.dirname(__FILE__)}/data/#{service}")
    end

    def get_and_save(date, proc_args = {}, &api_proc)
      return @cache.get(date) if @cache.has?(date)
      data = api_proc.call(proc_args)
      @cache.set(date, data)
      data
    end

    def delete key
      @cache.delete key
    end

    def flush
      @cache.flush
    end
  end
end
