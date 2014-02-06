task default: :post_daily

$:.push File.dirname(__FILE__) + '/lib/'

task :post_daily do
  require 'lifelog'
  Lifelog.daily
end
