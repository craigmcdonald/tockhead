# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tockhead/version'

Gem::Specification.new do |spec|
  spec.name          = "tockhead"
  spec.version       = Tockhead::VERSION
  spec.authors       = ["="]
  spec.email         = ["lefthandcraig@gmail.com"]
  spec.summary       = %q{Ruby wrapper for the Tictail API}
  spec.description   = %q{A ruby wrapper for the tictail API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "rest-client", "~> 1.7.3"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "thin"
  spec.add_development_dependency "daemons"
end
