require 'treetop'
require 'policy'
require 'slop'
require 'logger'
require 'log_buddy'

module Dgh  
  extend self

  # Parse input with the policy grammar
  #
  # @param input [String] apt-cache policy input
  # @return a list of hashes with info on packages
  def parse(input)
    @parser ||= PolicyParser.new
    @parser.parse input
  end

  # Find downgradable packages
  #
  # @param paca
  def find_downgradable(packages)
    packages.select do |pkg|
      pkg[:versions].any? do |ver|
        ver[:current] && ver[:sources].length == 1 && ver[:sources][0][:source] == '/var/lib/dpkg/status'
      end
    end
  end

  class << self
    def run
      optspec = <<-SPEC
Usage: dgh [options] inputfile(s)
---
d,debug Output debug messages
h,help  Output help message
      SPEC
      opts = Slop.optspec(optspec)
      opts.parse!

      if opts.help?
        puts opts
        exit
      end

      log = Logger.new(STDOUT)
      log.level = Logger::DEBUG
      LogBuddy.init :default_loggger => log, :disabled => !opts.debug?

      if ARGV.empty? || ARGV.any? {|a| !File.exist? a}
        puts opts
        puts "You can generate a policy listing by running e.g."
        puts "`dpkg --get-selections|egrep '\\binstall'|awk '{print $1}'|\\"
        puts "  xargs env LANG=C apt-cache policy`"
      else
        ARGV.each do |f|
          d "Parsing #{f}"
          find_downgradable(parse(File.open(f).read).content).each do |pkg|
            puts pkg[:name]
          end
        end
      end
    end
  end
end
