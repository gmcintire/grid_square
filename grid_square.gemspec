# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grid_square/version'

Gem::Specification.new do |gem|
  gem.name          = "grid_square"
  gem.version       = GridSquare::VERSION
  gem.authors       = ["Graham McIntire", "David Brady"]
  gem.email         = ["gmcintire@gmail.com"]
  gem.description   = %q{Encode/decode between lat/lng locations and US GridSquare references}
  gem.summary       = %q{Encode/decode between lat/lng locations and US GridSquare references}
  gem.homepage      = "https://github.com/gmcintire/grid_square"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
