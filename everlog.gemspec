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

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
