class Board
	
	def initialize(board)
		@board = board.split("\n")
	end
	
	def current_board
		@board.join("\n")
	end
	
	def left
		move_to({:row =>  0, :col => -1}) 
	end
	
	def right
		move_to({:row =>  0, :col =>  1}) 
	end
	
	def up
		move_to({:row => -1, :col =>  0})
	end
	
	def down
		move_to({:row =>  1, :col =>  0})
	end
	
	private 
		def move_to(direction)
			@current = find_player_position
			
			next_row = @current[:row]+direction[:row]
			next_col = @current[:col]+direction[:col]
			
			unless @board[next_row][next_col].chr == '#'
			    if @board[next_row][next_col].chr == 'c'
			        unless @board[next_row + direction[:row]][next_col + direction[:col]].chr  == '#' or  @board[next_row + direction[:row]][next_col + direction[:col]].chr  == 'c'
			            move_player(next_row,next_col)
			            object_to_place = 'c'
			            if (@board[next_row + direction[:row]][next_col + direction[:col]].chr == '.')
			            	object_to_place = 'o'
			            end
			            @board[next_row + direction[:row]][next_col + direction[:col]]= object_to_place
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
