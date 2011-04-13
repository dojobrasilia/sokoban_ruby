class Board
	
	def initialize(board)
		@board_m = board.split("\n")
	end
	
	def current_board
		@board_m.join("\n")
	end
	
	def left
		player_index = @board_m[1].index 'x'

		unless @board_m[1][player_index-1].chr == '#'
			@board_m[1][player_index-1]='x'
			@board_m[1][player_index]=' '
		end
		
	end
	
end
