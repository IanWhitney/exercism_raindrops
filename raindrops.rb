require 'prime'

#Tests Pass
#Expresses Intent
#No Duplication (DRY)
#Small

class Raindrops
  def self.convert(number)
    factors = Prime.prime_division(number).map {|x| x[0]}
    ret = ""
    ret << "Pling" if factors.include?(3)
    ret << "Plang" if factors.include?(5)
    ret << "Plong" if factors.include?(7)
    ret.empty? ? number.to_s : ret
  end
end
