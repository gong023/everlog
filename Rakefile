task default: :post_daily

$:.unshift File.expand_path("../../lib", __FILE__)
require 'lifelog'

task :post_daily do
  Lifelog.daily
end
