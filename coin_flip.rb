#easy simple game I made to show I could do some object oriented programming.

@count = 0
@won = 0
@npc_was_right = 0

def start_up_menu
	puts "***********************"
	puts "       Coin Flip"
	puts "***********************"
	puts ""
	puts "1: Play by yourself"
	puts "2: Play against a NPC"

	game_play_selection
end

def game_play_selection
	game_play_selection = gets.chomp

	if game_play_selection == 1
		@npc = false
	elsif game_play_selection == 2
		@npc = true
	end
	
	heads_or_tails_menu
end

def heads_or_tails_menu
	puts ""
	puts "Lets flip a coin."
	sleep(3)
	puts "---------------"
	puts "Heads or tails?"
	puts "---------------"
	puts "please type" 
	puts "H for heads or T for tails"

	heads_or_tails?
end

def heads_or_tails?
	@choice = gets.chomp.capitalize

	if @choice == "H" 
		@choice = "Heads"
	elsif @choice == "T"
		@choice = "Tails"
	else
		invalid_selection
	end

	coin_flip
end

def invalid_selection
	puts "     ******************"
	puts "     Invalid selection:"
	puts "Please put either 'H' or 'T.' "
	puts "     ******************"
	sleep(4)

	heads_or_tails_menu
end

def coin_flip
	coin_flip = rand(1..2)

	if coin_flip ==1
		@coin_lands_on = "Heads"
	else
		@coin_lands_on = "Tails"
	end

	game_mode
end

def game_mode
	if @npc = false
		coin_lands_on
	else
		npc_choice
	end
end

def npc_choice #I used a case statement here (even though if/else is faster) just to show off.
	coin_flip = rand(1..2)
	case coin_flip

	when 1
		@npc_chooses = "Heads"
	else
		@npc_chooses = "Tails"
	end	
	
	coin_lands_on
end

def coin_lands_on
	puts "The coin lands on..."
	sleep(3)
	puts "#{@coin_lands_on}."

	what_you_picked
end

def what_you_picked
	sleep(2)
	puts "-----------------"
	puts "You choose #{@choice}"

	npc_picked
end

def npc_picked
	if @npc = false
		right_or_wrong
	else
		puts "The NPC choose #{@npc_chooses}"
		right_or_wrong
	end
end

def right_or_wrong
	if @choice == @coin_lands_on
		congratulations
	else
		sorry
	end
end

def congratulations
	puts "You were right!"
	puts "Congratulations!"
	@won += 1

	game_count
end

def sorry
	puts "You were wrong."
	puts "Better luck next time."
	
	game_count
end

def game_count
	@count += 1
	sleep(3)

	did_the_npc_win
end

def did_the_npc_win
	if @npc_chooses == @coin_lands_on
		@npc_was_right += 1
	end

	win_percentage
end

def win_percentage
	puts "-------------------"	
	puts "You have flipped the coin #{@count} time(s)"
	puts "and been correct #{@won} time(s)."

	npc_score
end

def npc_score
	if @npc = true
		puts "The NPC has been correct: #{@npc_was_right} time(s)."
	end
	puts "-------------------"

	play_again_menu
end

def play_again_menu
	puts "Would you like to play again?"
	puts "-------------------"
	puts "please select: Y/N"
	puts "-------------------"
	
	play_again?
end

def play_again?
	play_again = gets.chomp.capitalize

	puts "\e[H\e[2J" # This erases previous text- giving you a clear terminal.
	if play_again == "Y"
		start_up_menu
	else
		start_up_menu
	end
end

start_up_menu