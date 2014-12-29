require 'prime'

# 1) Always return self
# 2) Objects can query themselves
# 3) Factories are exempt
class Raindrops < SimpleDelegator
  def self.convert(number)
    factors = Factors.new(number)
    sound = ""
    sound << "Pling" if factors.include?(3)
    sound << "Plang" if factors.include?(5)
    sound << "Plong" if factors.include?(7)
    sound = number.to_s if sound.empty?
    self.new(sound)
  end

  def initialize(sound)
    __setobj__(sound)
    self
  end
end

class Factors
  include Enumerable

  def initialize(number)
    @members = Prime.prime_division(number).map {|x| x[0]}
    self
  end

  def each &block
    @members.each{|member| block.call(member)}
  end
end
