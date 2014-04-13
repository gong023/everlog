$:.push File.dirname(File.dirname(__FILE__) + "/lib/")
require 'lifelog'
require 'dotenv'
Dotenv.load()

def load_fixture file
  JSON.parse(File.open(File.dirname(__FILE__) + '/fixtures/' + file).read)
end
