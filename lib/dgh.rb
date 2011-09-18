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
      opts = Slop.parse do
        banner "Usage: dgh [options] inputfile(s)"
        on :d, :debug, 'Output debug messages'
        on :h, :help, 'Output help message', :tail => true do
          puts help
          exit
        end
      end

      log = Logger.new(STDOUT)
      log.level = Logger::DEBUG
      LogBuddy.init :default_loggger => log, :disabled => !opts[:debug]

      if ARGV.empty? || ARGV.any? {|a| !File.exist? a}
        puts opts.help
        puts "You can generate a policy listing by running e.g."
        puts "`dpkg --get-selections|egrep '\\binstall'|awk '{print $1}'|\\"
        puts "  xargs env LANG=C apt-cache policy`"
      else
        ARGV.each do |f|
          d "Parsing #{f}"
          find_downgradable(parse(File.open(f).read).content).each do |pkg|
            puts "  " + pkg[:name]
          end
        end
      end
    end
  end
end
