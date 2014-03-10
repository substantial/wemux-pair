# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wemux/pair/version'

Gem::Specification.new do |spec|
  spec.name          = "wemux-pair"
  spec.version       = Wemux::Pair::VERSION
  spec.authors       = ["Aaron Jensen", "Beau Beveridge", "Shaun Dern"]
  spec.email         = ["tchdevs@substantial.com"]
  spec.description   = %q{Tunnel to another persons machine and join their wemux session}
  spec.summary       = %q{Use ssh tunnel to common server. Join host wemux session}
  spec.homepage      = "https://github.com/substantial/wemux-pair"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "rspec", "~> 2.14"

  spec.add_dependency "highline", "~> 1.6"
end
