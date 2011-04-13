class Board
	
	def initialize(board)
		@board_m = board.split("\n")
	end
	
	def current_board
		@board_m.join("\n")
	end
	
	def left
		move_to(-1) 
	end
	
	def right
		move_to(1) 
	end
	
	private 
		def move_to(direction)
			line = @board_m.find do |line|
				not line.index('x').nil?
			end

			player_index = line.index 'x'
			
			unless line[player_index+direction].chr == '#'
				line[player_index+direction]='x'
				line[player_index]=' '
			end
		end
	
end
