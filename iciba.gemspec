# -*- encoding: utf-8 -*-
require File.expand_path('../lib/iciba/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Ballantyne"]
  gem.email         = ["ussballantyne@gmail.com"]
  gem.description   = %q{iciba dictionary search wrapper}
  gem.summary       = %q{iciba dictionary search wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "iciba"
  gem.require_paths = ["lib"]
  gem.version       = Iciba::VERSION
  gem.add_dependency('rest-client', '2.1.0')
  gem.add_dependency(%q<hashie>, [">= 0"])
  gem.add_dependency(%q<multi_json>, [">= 0"])
  gem.add_dependency(%q<hpricot>, [">= 0"])
  gem.add_dependency(%q<string_to_pinyin>, ['>= 0'])
  gem.add_development_dependency(%q<pry>, ['>= 0'])
end
