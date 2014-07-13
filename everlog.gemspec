# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'everlog/version'

Gem::Specification.new do |spec|
  spec.name          = "everlog"
  spec.version       = Everlog::VERSION
  spec.authors       = ["gong023"]
  spec.email         = ["gon.gong.gone@gmail.com"]
  spec.description   = %q{post log got from third paty to evernote}
  spec.summary       = %q{post lifelog to evernote}
  spec.homepage      = "https://github.com/gong023/everlog"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'evernote_oauth'
  spec.add_dependency 'twitter', '~> 5.7.1'
  spec.add_dependency 'moves'
  spec.add_dependency 'geocoder'
  spec.add_dependency 'hatena-bookmark'
  spec.add_dependency 'octokit'
  spec.add_dependency 'wunderground'
  spec.add_dependency 'LocalFileCache'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
