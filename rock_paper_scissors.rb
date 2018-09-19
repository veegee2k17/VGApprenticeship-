# Make a two play Rock Paper Scissors Game. 
# Rock beats scissors
# Scissors beats paper
# Paper beats rock

# Ask for player plays using input, compare them, print out a message of congratulations to the winner, and ask if the players want to start a new game. 

# while loop: while a certain condition is true, keep doing something
# While player1 and player2's answers are the same, I want the game to ask them to choose again
while true 

	puts "Get ready to play Rock Paper Scissors"

	puts "Player 1 shoot your shot"
		player1_answer = gets.chomp

	puts "Player 2 shoot your shot"
		player2_answer = gets.chomp

	@rock = "rock"
	@paper = "paper"
	@scissors = "scissors"

	if player1_answer == player2_answer
		puts "Draw, choose again"
		redo
	end

	if player1_answer == @rock && player2_answer == @scissors
	  puts "Rock beats scissors, Congrats Player 1!"
	elsif player1_answer == @scissors && player2_answer == @rock
	  puts "Rock beats scissors, Congrats Player 2!"
	end

	if player1_answer == @paper && player2_answer == @rock
	  puts "Paper beats rock, Congrats Player 1!"
	elsif player1_answer == @rock && player2_answer == @paper
	  puts "Paper beats rock, Congrats Player 2!"
	end

	if player1_answer == @scissors && player2_answer == @paper
	  puts "Scissors beats paper, Congrats Player 1!"
	elsif player1_answer ==    @paper && player2_answer == @scissors
	  puts "Scissors beats paper, Congrats Player 2!"
		end

	puts "Type yes if you want to play again"
		player_answer = gets.chomp
	@yes = "yes"
	@no = "no"

	if player_answer == "no"
		break
	end

end

# if player_answer == "yes"

