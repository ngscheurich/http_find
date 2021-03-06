# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "http_find/version"

Gem::Specification.new do |spec|
  spec.name          = "http_find"
  spec.version       = HttpFind::VERSION
  spec.authors       = ["Nicholas Scheurich"]
  spec.email         = ["nick@scheurich.me"]

  spec.summary       = "HTTP response searcher"
  spec.description   = "Searches the contents of an HTTP response for a specified term or pattern."
  spec.homepage      = "https://github.com/ngscheurich/http_find"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13"
  spec.add_runtime_dependency "colorize", "~> 0.8"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.1"
  spec.add_development_dependency "webmock", "~> 2.1"
end
