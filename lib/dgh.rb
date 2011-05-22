require 'treetop'
require 'policy'

module Dgh  
  extend self

  def parse(input)
    @parser ||= PolicyParser.new
    @parser.parse input
  end

  def run
    ARGV.each {|f| File.exist?(f) && parse(File.open(f).read)}
  end
end
