require 'prime'

# 1) Always return self
# 2) Objects can query themselves
# 3) Factories are exempt
class Raindrops < String
  def self.convert(number)
    self.new(number)
  end

  def initialize(number)
    super(RainSounds.new(Factors.new(number), number))
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
  def initialize(numbers, fallback)
    sounds = numbers.inject("") { |ret, n| ret << SoundFactory.build(n)}
    if sounds.empty?
      super(fallback.to_s)
    else
      super(sounds)
    end
    self
  end
end

class SoundFactory
  def self.build(number)
    {
      3 => "Pling",
      5 => "Plang",
      7 => "Plong",
    }[number].to_s
  end
end
