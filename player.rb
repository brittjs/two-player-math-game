
class Player
  
  attr_reader :lives_left, :score, :name


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
