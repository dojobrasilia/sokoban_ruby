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
			@current = find_player_position
			
			next_row = @current[:row]+direction[0]
			next_col = @current[:col]+direction[1]
			
			unless @board[next_row][next_col].chr == '#'
			    if @board[next_row][next_col].chr == 'c'
			        unless @board[next_row + direction[0]][next_col].chr  == '#'
			            move_player(next_row,next_col)
			            @board[next_row + direction[0]][next_col]= 'c'
			        end
			    else
				    move_player(next_row,next_col)
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
		
		def move_player(next_row,next_col)
            @board[next_row][next_col]='x'
	        @board[@current[:row]][@current[:col]]=' '
		end
end
