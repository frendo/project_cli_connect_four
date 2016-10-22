class Board

	# Constants
		ROWS = 6
		COLUMNS = 7
		CHIPS = 21
	# Initialization

	def initialize
		@board = []
	end

	def reset_board()
		@board = Array.new(ROWS, 'o')
		@board.map! { Array.new(COLUMNS, 'o') }
	end

	def deal_chips()
		return CHIPS
	end
	def make_move(column, colour)
		 if @board[ROWS-1][column] == 'o'
			row = get_last_chip_position(column)
			@board[row][column] = colour	
			return true
		else
			return false
		end
	end
	def render_board()
		@board.reverse.each { |x|  puts print x}
	end
	def get_last_chip_position(column)
		for row in 0...ROWS do		
			if @board[row][column].index('o')
				return row
			else
			end
		end
	end
end
