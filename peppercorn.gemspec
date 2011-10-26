# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "peppercorn/version"

Gem::Specification.new do |s|
  s.name        = "peppercorn"
  s.version     = Peppercorn::VERSION
  s.authors     = ["Wade West"]
  s.email       = ["wwest81@gmail.com"]
  s.homepage    = "https://github.com/wadewest/peppercorn"
  s.summary     = %q{A simple gem to truncate HTML, with other features coming in the future.}
  s.description = %q{A simple gem to truncate HTML, with other features coming in the future.}

  s.rubyforge_project = "peppercorn"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "yard", "~> 0.7"
  s.add_development_dependency "rspec", "~> 2.7"
  s.add_development_dependency "guard-rspec", "~> 0.5"
  s.add_development_dependency "guard-yard", "~> 1.0"
  s.add_development_dependency "RedCloth", "~> 4.2"
  # s.add_runtime_dependency "rest-client"
  # s.add_dependency "htmlentities"
  s.add_dependency "nokogiri", "~> 1.5"
end
