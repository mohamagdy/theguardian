# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'theguardian/version'

Gem::Specification.new do |spec|
  spec.name          = "theguardian"
  spec.version       = Theguardian::VERSION
  spec.authors       = ["Mohamed Magdy"]
  spec.email         = ["eng.mohamagdy@gmail.com"]
  spec.description   = "The Guardian Ruby API"
  spec.summary       = "Get an access to the Guardian API"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_dependency("rest-client")
  spec.add_dependency("addressable")
  spec.add_dependency("recursive-open-struct")
  
  # Development dependencies
  spec.add_development_dependency("bundler", "~> 1.3")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
end
