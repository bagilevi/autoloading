# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autoloading/version'

Gem::Specification.new do |spec|
  spec.name          = "autoloading"
  spec.version       = Autoloading::VERSION
  spec.authors       = ["Levente Bagi"]
  spec.email         = ["bagilevi@gmail.com"]
  spec.summary       = %q{Autoload Ruby classes or modules}
  spec.description   = %q{Autoload Ruby classes or modules by inferring the file path from the name}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
