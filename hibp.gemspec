# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hibp/version'

Gem::Specification.new do |spec|
  spec.name          = "hibp"
  spec.version       = Hibp::VERSION
  spec.authors       = ["Michael Henriksen"]
  spec.email         = ["michenriksen@neomailbox.ch"]
  spec.description   = %q{A simple tool to check a bunch of email addresses against the Have I Been Pwned? API.}
  spec.summary       = %q{A simple tool to check a bunch of email addresses against the Have I Been Pwned? API.}
  spec.homepage      = "https://github.com/michenriksen/hibp"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_dependency 'methadone'
  spec.add_dependency 'paint'
  spec.add_dependency 'ruby-progressbar'
  spec.add_dependency 'thread'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
