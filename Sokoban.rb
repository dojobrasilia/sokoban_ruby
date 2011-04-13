class Board
	
	def initialize(board)
		@board = board
		@board_m = board.split("\n")
	end
	
	def current_board
		@board
		@board_m.join("\n")
	end
	
	def left
		@board_m[1][1]='x';
		@board_m[1][2]=' ';
	end
	
end
