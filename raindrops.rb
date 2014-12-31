require 'prime'

#Tests Pass
#Expresses Intent
#No Duplication (DRY)
#Small

class Raindrops
  def self.convert(drops, surface: Bucket, counter: RaindropCounts)
    SoundEffect.made_by(drops, surface, counter).to_s
  end
end

class RaindropCounts
  include Enumerable

  def initialize(number)
    @members = Prime.prime_division(number).map(&:first)
  end

  def each &block
    @members.each{|member| block.call(member)}
  end
end

class SoundEffect
  def self.made_by(substance, surface, counter)
    self.new(substance, surface, counter)
  end

  def initialize(substance, surface, counter)
    self.substance = substance
    self.surface = surface
    self.counter = counter
    make_sound
  end

  def silent?
    sound.empty?
  end

  def to_s
    silent? ? substance.to_s : sound.to_s
  end

  private

  attr_accessor :substance, :surface, :counter

  def sound
    @sound ||= ""
  end

  def make_sound
    counter.new(substance).each do |hit|
      sound << surface.make_sound(hit)
    end
  end
end

class Bucket
  def self.make_sound(hit_count)
    case hit_count
    when 3
      "Pling"
    when 5
      "Plang"
    when 7
      "Plong"
    else
      ""
    end
  end
end
