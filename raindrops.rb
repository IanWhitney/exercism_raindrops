require 'prime'

# 1) Always return self
# 2) Objects can query themselves
# 3) Factories are exempt
class Raindrops < SimpleDelegator
  def self.convert(number)
    factors = Prime.prime_division(number).map {|x| x[0]}
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
