require_relative 'player'
require 'colorize'

class InvalidNameError < StandardError
end

class InvalidInputError < StandardError
end

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
  loop do
    begin
      Integer(@answer)
    rescue ArgumentError
      begin 
        raise InvalidInputError
      rescue InvalidInputError
        puts "Please enter a numeric value"
        @answer = gets.chomp
      end
    else
      break
    end
  end    
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

while @player_name.to_s.empty?
  puts "Player 1, please enter your name."
  @player_name = gets.chomp
  begin
    if @player_name.to_s.empty? 
      raise InvalidNameError, "Error: Invalid name."
    end
  rescue InvalidNameError => e
    p e.message
    puts "Enter a valid name."
  end  
  @player_1 = Player.new(@player_name)
end

while @player_name2.to_s.empty? 
  puts "Player 2, please enter your name."
  @player_name2 = gets.chomp
  begin
    if @player_name2.to_s.empty? 
      raise InvalidNameError, "Error: Invalid name."
    end
  rescue InvalidNameError => e
    p e.message
    puts "Enter a valid name."
  end  
  @player_2 = Player.new(@player_name2)
end


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

