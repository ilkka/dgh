require 'rubygems'
require 'spork'

Spork.prefork do
  require 'bundler'
  begin
    Bundler.setup(:default, :development)
  rescue Bundler::BundlerError => e
    $stderr.puts e.message
    $stderr.puts "Run `bundle install` to install missing gems"
    exit e.status_code
  end

  require 'rspec/expectations'
end

Spork.each_run do
end

