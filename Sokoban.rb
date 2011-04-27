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
			
			unless is_wall(next_row,next_col)
			    if is_crate(next_row,next_col)
			        unless is_wall(next_row + direction[:row],next_col + direction[:col]) or  is_crate(next_row + direction[:row],next_col + direction[:col])
			            move_player(next_row,next_col)
			            object_to_place = 'c'
			            if (is_goal(next_row + direction[:row],next_col + direction[:col]))
			            	object_to_place = 'o'
			            end
			            @board[next_row + direction[:row]][next_col + direction[:col]]= object_to_place
			        end
			    else
				    move_player(next_row,next_col)
				end
			end
			
		end
		
		def is_wall(row, col)
			@board[row][col].chr == '#'
		end
		
		def is_crate(row, col)
			@board[row][col].chr == 'c'
		end
		
		def is_goal(row, col)
			@board[row][col].chr == '.'
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
