class Board
	
	
	def initialize(board)
	    @left = [0,-1]
	    @right = [0,1]
	    @up = [-1,0]
	    @down = [1,0]
		@board_m = board.split("\n")
	end
	
	def current_board
		@board_m.join("\n")
	end
	
	def left
		move_to(@left) 
	end
	
	def right
		move_to(@right) 
	end
	
	def up
		move_to(@up)
	end
	
	def down
		move_to(@down)
	end
	
	private 
		def move_to(direction)
			current_position = find_player_position
			
			next_row_position = current_position[:row]+direction[0]
			next_col_position = current_position[:col]+direction[1]
			
			unless @board_m[next_row_position][next_col_position].chr == '#'
				@board_m[next_row_position][next_col_position]='x'
				@board_m[current_position[:row]][current_position[:col]]=' '
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
