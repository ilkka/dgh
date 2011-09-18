# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'dgh/version'

Gem::Specification.new do |s|
  s.name = 'dgh'
  s.version = Dgh::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ilkka Laukkanen"]
  s.email = [%q{ilkka.s.laukkanen@gmail.com}]
  s.homepage = %q{http://github.com/ilkka/dgh}
  s.summary = %q{The Debian/Ubuntu Downgrade Helper}
  s.licenses = ["GPLv3"]
  s.description = %q{Dgh helps when you have to manually downgrade a large amount of packages.
It requires the user to generate a file with `apt-cache policy` output for all
installed packages, which it then reads. It looks for packages that have a
currently installed version that doesn't exist in any repository, and prints
those. This includes both locally generated packages that never did exist in
any repository, and more crucially, packages that have been upgraded from e.g.
a PPA that has since been removed from the system.
}

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map {|f| File.basename f}
  s.default_executable = %q{dgh}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.require_paths = ["lib"]

  s.add_runtime_dependency('treetop', [">= 0"])
  s.add_runtime_dependency('slop', ["~> 1.9.1"])
  s.add_runtime_dependency('log_buddy', ["~> 0.6.0"])

  s.add_development_dependency('rake', ["~> 0.9.0"])
  s.add_development_dependency('rspec', ["~> 2.6.0"])
  s.add_development_dependency('yard', ["~> 0.6.0"])
  s.add_development_dependency('cucumber', [">= 0"])
  s.add_development_dependency('bundler', ["~> 1.0.13"])
  s.add_development_dependency('jeweler', ["~> 1.5.2"])
  s.add_development_dependency('spork', [">= 0"])
  s.add_development_dependency('watchr', [">= 0"])
end

