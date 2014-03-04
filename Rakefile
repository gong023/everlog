task default: :post_daily

$:.push File.dirname(__FILE__) + '/lib/'

task :post_daily do
  require 'lifelog'
  ENV['dry'] ||= 'true'
  ENV['evernote_sandbox'] ||= 'true'
  Lifelog.daily(ENV['dry'], ENV['evernote_sandbox'])
end
