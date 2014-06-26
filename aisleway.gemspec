lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aisleway/version'

Gem::Specification.new do |spec|
  spec.name          = 'aisleway'
  spec.version       = Aisleway::VERSION
  spec.authors       = ['Jamie Wright']
  spec.email         = ['jamie@brilliantfantastic.com']
  spec.summary       = %q{Component based services for building e-commerce functionality in Ruby}
  spec.description   = %q{Component based services for building e-commerce functionality in Ruby}
  spec.homepage      = 'http://aisleway.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z -- lib/* README.md aisleway.gemspec`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.6'
  spec.add_development_dependency 'minitest', '~> 5'
  spec.add_development_dependency 'rake',     '~> 10'
end
