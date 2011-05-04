class Board

	def initialize(board)
		@board = board.split("\n")
		populate_goals
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
			
			after_next_row = next_row + direction[:row]
			after_next_col = next_col + direction[:col]
			
		    if is_crate(next_row,next_col)
		    
		        unless is_wall(after_next_row,after_next_col) or
		        	   is_crate(after_next_row, after_next_col)
		        	   
		            move_player(next_row,next_col)
		            object_to_place = 'c'
		            
		            if (is_goal(after_next_row,after_next_col))
		            	object_to_place = 'o'
		            end
		            
		            @board[after_next_row][after_next_col]= object_to_place
		        end
		        
		    elsif not is_wall(next_row,next_col)
			    move_player(next_row,next_col)
			end
			
			
		end
		
		def is_wall(row, col)
			@board[row][col].chr == '#'
		end
		
		def is_crate(row, col)
			@board[row][col].chr == 'c' or @board[row][col].chr == 'o' 
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
		
		def populate_goals
			@goals = []
			
			@board.each_with_index do |line,row|
				col = 0
				line.each_char do |char| 
					if (char == '.')
						@goals << {:row => row, :col => col}
					end
					col+=1
				end
				
			end
			
		end
		
		def move_player(next_row,next_col)
            @board[next_row][next_col]='x'
	        
	        found_goal = @goals.find do |g|
				@current[:row] == g[:row] and @current[:col] == g[:col]
			end
		    
		    if found_goal
		    	@board[@current[:row]][@current[:col]]= '.'
		    else
		    	@board[@current[:row]][@current[:col]]=' '
		    end	
		end
end
