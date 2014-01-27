task default: :post_daily

$:.concat Dir.glob('lib/**/')

task :post_daily do
  require 'lifelog'
  Lifelog.daily
end
