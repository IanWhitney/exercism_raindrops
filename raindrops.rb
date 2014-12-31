require 'prime'

#Tests Pass
#Expresses Intent
#No Duplication (DRY)
#Small

class Raindrops
  def self.convert(number, surface: Bucket)
    drops = DropCounts.new(number)
    sound = Sound.made_by(drops, surface)
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

class Sound < String
  def self.made_by(drops, surface)
    self.new(drops, surface)
  end

  def initialize(drops, surface)
    drops.each do |drop|
      sound << surface.make_sound(drop)
    end
    super(sound)
  end

  private

  def sound
    @sound ||= ""
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
