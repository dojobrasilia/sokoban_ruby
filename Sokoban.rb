class Board
	
	def initialize(board)
		@board_m = board.split("\n")
	end
	
	def current_board
		@board_m.join("\n")
	end
	
	def left
		move_to(0,-1) 
	end
	
	def right
		move_to(0,1) 
	end
	
	def up
		move_to(-1,0)
	end
	
	private 
		def move_to(row, col)
			line = @board_m.find do |line|
				not line.index('x').nil?
			end
			
			row_index = @board_m.index(line)
			col_index = line.index 'x'
			
			unless @board_m[row_index+row][col_index+col].chr == '#'
				@board_m[row_index+row][col_index+col]='x'
				@board_m[row_index][col_index]=' '
			end
		end
end
