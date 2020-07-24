# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/nodenv/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-nodenv"
  spec.version       = Itamae::Plugin::Recipe::Rbenv::VERSION
  spec.authors       = ["Takashi Kokubun"]
  spec.email         = ["takashikkbn@gmail.com"]
  spec.summary       = %q{Itamae plugin to install ruby with nodenv}
  spec.description   = %q{Itamae plugin to install ruby with nodenv}
  spec.homepage      = "https://github.com/k0kubun/itamae-plugin-recipe-nodenv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae", "~> 1.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
