require 'prime'

#Tests Pass
#Expresses Intent
#No Duplication (DRY)
#Small

class Raindrops
  def self.convert(number)
    drops = DropCounts.new(number)
    sound = ""
    sound << "Pling" if drops.include?(3)
    sound << "Plang" if drops.include?(5)
    sound << "Plong" if drops.include?(7)
    sound.empty? ? number.to_s : sound
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
