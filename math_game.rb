require_relative 'player'
require 'colorize'


def generate_question
  @num1 = rand(20)
  @num2 = rand(20)
  ops = [:+, :-, :*] 
  @op1 = ops.sample
  "what is #{@num1} #{@op1} #{@num2}?"
end


def prompt_player_for_answer(name)
  puts "#{name}, #{generate_question}"
  @answer = gets.chomp
end


def evaluate_answer
  @num1.send(@op1, @num2)
end


def check_for_winner
  if @player_1.score > @player_2.score 
    puts "Player 1 wins!"
  else 
    puts "Player 2 wins!"
  end
end


puts "Player 1, please enter your name."
@player_name = gets.chomp
@player_1 = Player.new(@player_name)


puts "Player 2, please enter your name."
@player_name = gets.chomp
@player_2 = Player.new(@player_name)


while @player_1.lives_left > 0 && @player_2.lives_left > 0
  
  prompt_player_for_answer(@player_1.name)
  if @answer.to_i == evaluate_answer
    puts "Correct! The score is: #{@player_1.name} has #{@player_1.gain_a_point} point(s). #{@player_2.name} has #{@player_2.score} point(s).".colorize( :green )
  else
    puts "Sorry, that's incorrect. #{@player_1.name} you have #{@player_1.lose_a_life} lives left.".colorize( :red )
  end
  if @player_1.lives_left == 0 || @player_2.lives_left == 0
    check_for_winner
    break
  end
    
  prompt_player_for_answer(@player_2.name)
  if @answer.to_i == evaluate_answer
    puts "Correct! The score is: #{@player_1.name} has #{@player_1.score} point(s). #{@player_2.name} has #{@player_2.gain_a_point} point(s).".colorize( :green )
  else
    puts "Sorry, that's incorrect. #{@player_2.name} you have #{@player_2.lose_a_life} lives left.".colorize( :red )
  end
  if @player_1.lives_left == 0 || @player_2.lives_left == 0
    check_for_winner
    break
  end

end

