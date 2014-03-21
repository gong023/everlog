task default: :post_daily

$:.push File.dirname(__FILE__) + '/lib/'
require 'lifelog'

task :post_daily do
  ENV['output'] ||= 'local'
  Lifelog.daily(ENV['output'])
end

task :upload_sample do
  Lifelog.upload_sample
end
