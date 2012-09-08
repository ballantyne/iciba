# -*- encoding: utf-8 -*-
require File.expand_path('../lib/iciba/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Ballantyne"]
  gem.email         = ["ussballantyne@gmail.com"]
  gem.description   = %q{iciba wrapper}
  gem.summary       = %q{iciba wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "iciba"
  gem.require_paths = ["lib"]
  gem.version       = Iciba::VERSION
end
