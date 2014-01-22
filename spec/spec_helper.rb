$:.concat Dir.glob(File.dirname(File.dirname(__FILE__)) + "/lib/**/")
require 'lifelog'
require 'pp'
Dotenv.load
