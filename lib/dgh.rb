require 'treetop'
require 'policy'

module Dgh  
  extend self

  def parse(input)
    @parser ||= PolicyParser.new
    @parser.parse input
  end
end
