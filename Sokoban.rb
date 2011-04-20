class Board
	
	def initialize(board)
	    @left = [0,-1]
	    @right = [0,1]
	    @up = [-1,0]
	    @down = [1,0]
		@board = board.split("\n")
	   
	end
	
	def current_board
		@board.join("\n")
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
			@current_position = find_player_position
			
			next_row_position = @current_position[:row]+direction[0]
			next_col_position = @current_position[:col]+direction[1]
			
			unless @board[next_row_position][next_col_position].chr == '#'
			    if @board[next_row_position][next_col_position].chr == 'c'
			        unless @board[next_row_position + 1][next_col_position].chr  == '#'
			            move_player(next_row_position,next_col_position)
			            @board[next_row_position + 1][next_col_position]='c'
			        end
			    else
				    move_player(next_row_position,next_col_position)
				    end
			end
		end
		
		def find_player_position
			line = @board.find do |line|
				not line.index('x').nil?
			end
			
			row_index = @board.index(line)
			col_index = line.index 'x'
			
			{:row => row_index, :col => col_index}
		end
		
		def move_player(next_row_position,next_col_position)
            @board[next_row_position][next_col_position]='x'
	        @board[@current_position[:row]][@current_position[:col]]=' '
		end
end
