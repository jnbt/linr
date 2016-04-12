lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "linr/version"

Gem::Specification.new do |spec|
  spec.name          = "linr"
  spec.version       = Linr::VERSION
  spec.authors       = ["Jonas Thiel"]
  spec.email         = ["jonas@thiel.io"]

  spec.summary       = "A simple UDP client for InfluxDB"
  spec.description   = "A simple UDP client for InfluxDB"
  spec.homepage      = "https://github.com/jnbt/linr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 11.1"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "inch", "~> 0.7"
  spec.add_development_dependency "rubocop", "~> 0.35"
end
