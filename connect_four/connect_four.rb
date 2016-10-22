require_relative "human_player.rb"
require_relative "computer_player.rb"
require_relative "board.rb"
class ConnectFour

	# Constants


	# Initalization

	def initialize
		render_welcome
		@board = Board.new
		@player_one = HumanPlayer.new
		play()
	end

	def play()
		prep_new_game()
		while true
			puts "***********************************"
			@board.render_board()
			puts "***********************************"
			puts "Player One:"
			puts @player_one.get_chip_stack()
			puts "Player One make your move:"
			move(@player_one)
			@board.render_board()
			puts "Player Two:"
			puts @player_two.get_chip_stack()
			puts "Player Two make your move:"
			move(@player_two)
			puts "***********************************"
			@board.render_board()
			puts "***********************************"
			
		end
	end
	def prep_new_game()
		@board.reset_board	
		@player_two = set_player_mode()
		@player_one.set_colour()
		@player_one.set_chip_stack(@board.deal_chips(), @player_one.get_colour)
		@player_two.set_opposition_colour(@player_one.get_colour)
		@player_two.set_chip_stack(@board.deal_chips(), @player_two.get_colour)
	end
	def move(player)
			requested_move = player.request_move()
			if player.check_chip_stack()
				if @board.make_move(requested_move, player.get_colour)
					player.remove_chip()
				else
					column = requested_move.to_i + 1
					puts "Column #{column.to_s} is full, please choose another column."
				end
			else
				puts "You have no chips left to play."
			end

	end
	def render_welcome()
		puts "Welcome to Connect Four!"
	end
	
	def set_player_mode()
		while true
			puts "Select 1 for One player mode, or 2 for Two player mode"

			player_mode = gets.chomp.to_i

			case player_mode

			when 1
				puts "One Player Mode is being initialized..."
				return ComputerPlayer.new
			when 2
				puts "Two Player mode is being initialized..."
				false
				return HumanPlayer.new
			else
				puts "Please input a value of 1 or 2"
			end
		end
	end
end
g = ConnectFour.new
