@player1_score = 0
@player2_score = 0

@player_1lives = 3
@player_2lives = 3


def generate_question
  @num1 = rand(20)
  @num2 = rand(20)
  "What is #{@num1} + #{@num2}?"
end


def prompt_player_for_answer(player_number)
  puts "Player #{player_number}, #{generate_question}?"
  @answer = gets.chomp
end

def verify_answer
  @num1 + @num2
end


def check_for_winner
  if @player1_score > @player2_score 
    puts "Player 1 wins!"
  else 
    puts "Player 2 wins!"
  end
end



while @player_1lives > 0 && @player_2lives > 0
  
  prompt_player_for_answer(1)
    if @answer.to_i == verify_answer
      puts "Correct! The score is: Player 1 has #{@player1_score += 1} point(s). Player 2 has #{@player2_score} point(s)."
    else
      puts "Sorry, that's incorrect. Player 1 you have #{@player_1lives -= 1} lives left."
    end
    if @player_1lives == 0 || @player_2lives == 0
      check_for_winner
      break
    end
    
  prompt_player_for_answer(2)
    if @answer.to_i == verify_answer
      puts "Correct! The score is: Player 1 has #{@player1_score} points. Player 2 has #{@player2_score += 1} point(s)."
    else
      puts "Sorry, that's incorrect. Player 2 you have #{@player_2lives -= 1} lives left."
    end
    if @player_1lives == 0 || @player_2lives == 0
      check_for_winner
      break
    end

end


