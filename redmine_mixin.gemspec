# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine_mixin/version'

Gem::Specification.new do |gem|
  gem.name          = "redmine_mixin"
  gem.version       = RedmineMixin::VERSION
  gem.authors       = ["Mike Quinn"]
  gem.email         = ["memikequinn@gmail.com"]
  gem.description   = %q{Provides (some) Redmine models via <Model>Resource }
  gem.summary       = %q{Provides (some) Redmine models via <Model>Resource }
  gem.homepage      = "https://github.com/memikequinn/redmine_mixin"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
