# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-test/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-test'
  spec.version       = CocoapodsTest::VERSION
  spec.authors       = ['Kyle Fuller']
  spec.email         = ["kyle@fuller.li"]
  spec.description   = %q{CocoaPods plugin to run tests for a Pod.}
  spec.summary       = %q{CocoaPods plugin to run tests for a Pod.}
  spec.homepage      = 'https://github.com/CocoaPods/cocoapods-test'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
