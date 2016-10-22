class ComputerPlayer < HumanPlayer


	def request_move()
		puts "computer will make this move..."
		return rand(0..6)
	end

end
