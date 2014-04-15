$:.push File.dirname(File.dirname(__FILE__) + "/lib/")
require 'everlog'
require 'dotenv'
Dotenv.load(File.dirname(__FILE__) + '/.env.test')

def load_fixture file
  JSON.parse(File.open(File.dirname(__FILE__) + '/fixtures/' + file).read)
end
