# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slackpolice/version'

Gem::Specification.new do |spec|
  spec.name          = "slackpolice"
  spec.version       = Slackpolice::VERSION
  spec.authors       = ["ISOBE Kazuhiko"]
  spec.email         = ["muramasa64@gmail.com"]

  spec.summary       = %q{slackpolice archive empty channels}
  spec.description   = %q{slackpolice archive empty channels}
  spec.homepage      = "https://github.com/muramasa64/slackpolice"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor", "0.19.1"
  spec.add_dependency "slack-api-wrapper", "0.2.0"
end
