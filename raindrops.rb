require 'prime'

#Tests Pass
#Expresses Intent
#No Duplication (DRY)
#Small

class Raindrops
  def self.convert(number)
    drops = DropCounts.new(number)
    ret = ""
    ret << "Pling" if drops.include?(3)
    ret << "Plang" if drops.include?(5)
    ret << "Plong" if drops.include?(7)
    ret.empty? ? number.to_s : ret
  end

end

class DropCounts
  include Enumerable

  def initialize(number)
    @members = Prime.prime_division(number).map(&:first)
  end

  def each &block
    @members.each{|member| block.call(member)}
  end
end
