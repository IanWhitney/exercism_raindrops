require 'prime'

# 1) Always return self
# 2) Objects can query themselves
# 3) Factories are exempt
class Raindrops < SimpleDelegator
  def self.convert(number)
    sound = RainSounds.new(Factors.new(number))
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

class RainSounds < String
  def initialize(numbers)
    sound = ""
    sound << "Pling" if numbers.include?(3)
    sound << "Plang" if numbers.include?(5)
    sound << "Plong" if numbers.include?(7)
    super(sound)
  end
end
