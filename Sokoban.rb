class Board
	
	def initialize(board)
		@board_m = board.split("\n")
	end
	
	def current_board
		@board_m.join("\n")
	end
	
	def left
		line = @board_m.find do |line|
			not line.index('x').nil?
		end
		
		player_index = line.index 'x'

		unless line[player_index-1].chr == '#'
			line[player_index-1]='x'
			line[player_index]=' '
		end
		
	end
	
end
