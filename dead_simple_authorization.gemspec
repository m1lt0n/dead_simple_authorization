# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dead_simple_authorization/version'

Gem::Specification.new do |spec|
  spec.name          = "dead_simple_authorization"
  spec.version       = DeadSimpleAuthorization::VERSION
  spec.authors       = ["Pantelis Vratsalis"]
  spec.email         = ["pvratsalis@gmail.com"]
  spec.summary       = %q{A pretty simple solution for permissions on resources - framework agnostic}
  spec.description   = %q{a very simple authorization library with two main methods: can? and authorize, checking the permissions of a user to perform an action on a resource}
  spec.homepage      = "https://github.com/m1lt0n/dead_simple_authorization"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
