require 'treetop'
require 'policy'

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

  def run
    ARGV.each do |f|
      puts "Parsing #{f}:"
      find_downgradable(parse(File.open(f).read)).each do |pkg|
        puts "  " + pkg[:name]
      end
    end
  end
end
