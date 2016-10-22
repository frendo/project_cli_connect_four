require_relative "board.rb"
class HumanPlayer

	# Constants
		COLOURS = { 'r' => "Red", 'y' => "Yellow" }

	# Initialization

	def initialize
		@chip_stack = []
		@colour = ''
	end

	def set_chip_stack(chips, colour)
		@chip_stack = Array.new(chips, colour)
		puts "Chips unused: " + @chip_stack.to_s
	end
	def remove_chip()

		@chip_stack.pop
	end
	def get_chip_stack()
		return @chip_stack.size
	end
	def check_chip_stack()
		if @chip_stack.length > 0
			return true
		else
			return false
		end
	end
	def set_colour()
		while true
			puts "Select r for red chips or y for yellow chips"
			colour_selection = gets.chomp.downcase.to_s
			case colour_selection
				when 'r'
					puts "You have selected the #{COLOURS[colour_selection]} chips"
					return @colour = colour_selection
				when 'y'	
					puts "You have selected the #{COLOURS[colour_selection]} chips"
					return @colour = colour_selection
				else
					puts "Input either a value of r or y"
			end
		end
	end
	def get_colour()
		return @colour
	end
	def set_opposition_colour(colour)
		if colour == 'r'

			@colour = 'y'

		else

			@colour ='r'
		end
		puts "Opposition is playing with the #{COLOURS[@colour]} chips"
	end
	def request_move()
		while true
			puts "Please enter a coloumn in which to drop a chip (1-7)..."

			requested_column = gets.chomp.to_i
			
			if (1..7).include?(requested_column)
				puts "chip has been dropped into coloumn #{requested_column}"

				return requested_column - 1
 			else
				puts "Please enter a valid column number bewtween 1 and 7"
			end	
		end
	end
end
