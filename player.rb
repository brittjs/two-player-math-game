
class Player
  
  attr_accessor :name 
  attr_reader :lives_left, :score


  def initialize(name)
    @name = name
    @score = 0
    @lives_left = 3
  end


  def gain_a_point
    @score += 1
  end


  def lose_a_life
    @lives_left -= 1
  end


end
