require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "dgh"
  gem.homepage = "http://github.com/ilkka/dgh"
  gem.license = "GPLv3"
  gem.summary = %Q{The Debian/Ubuntu Downgrade Helper}
  gem.description = <<EOS
Dgh helps when you have to manually downgrade a large amount of packages.
It requires the user to generate a file with `apt-cache policy` output for all
installed packages, which it then reads. It looks for packages that have a
currently installed version that doesn't exist in any repository, and prints
those. This includes both locally generated packages that never did exist in
any repository, and more crucially, packages that have been upgraded from e.g.
a PPA that has since been removed from the system.
EOS
  gem.email = "ilkka.s.laukkanen@gmail.com"
  gem.authors = ["Ilkka Laukkanen"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
