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
	def check_horizontals(board)
		board.each do |row|
			row_str = row.join('').to_s
			if ((row_str.include? "rrrr") || (row_str.include? "yyyy")) 
				return true
			else
				return false
			end
		end
	end
	def check_verticals()
		for column in 0...COLUMNS do
			chips = ''
			for row in 0...ROWS do
				chips = chips + @board[row][column].to_s
			end
			if ((chips.include? "rrrr")  || (chips.include? "yyyy"))
				return true
			else
				return false
			end
		end
	end
	def check_diagonals()
		padding = @board.size - 1
		padded_matrix = []
		@board.each do |row|
			inverse_padding = @board.size - padding
			padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
			padding -= 1
		end
		if check_horizontals(padded_matrix)
			return true
		else
			return false
		end
	end
	def check_status()
		if (check_horizontals(@board) || check_verticals() || check_diagonals())
			return true
		else

			return false
		end
	end
end
