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
			position = find_player_position
			
			unless @board_m[position[:row]+row][position[:col]+col].chr == '#'
				@board_m[position[:row]+row][position[:col]+col]='x'
				@board_m[position[:row]][position[:col]]=' '
			end
		end
		
		def find_player_position
			line = @board_m.find do |line|
				not line.index('x').nil?
			end
			
			row_index = @board_m.index(line)
			col_index = line.index 'x'
			
			{:row => row_index, :col => col_index}
		end
end
