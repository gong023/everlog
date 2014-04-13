$:.push File.dirname(File.dirname(__FILE__) + "/lib/")
require 'lifelog'
require 'json'
require 'pp'
Dotenv.load(__FILE__ + '.env.test')

def load_fixture file
  JSON.parse(File.open(File.dirname(__FILE__) + '/fixtures/' + file).read)
end
