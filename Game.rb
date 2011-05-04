require 'Sokoban'

board_st =   "#####\n" +
			     	 "#   #\n" +
			     	 "# ..#\n" + 
			     	 "# cc#\n" + 
 			     	 "# x #\n" + 
				     "#####"
				     
 b = Board.new(board_st)
puts b.current_board
while true do
	cmd = STDIN.gets	
	
	if cmd == "up\n"
		b.up
	elsif cmd == "down\n"
		b.down
	elsif cmd == "left\n"
		b.left
	elsif cmd == "right\n"
		b.right
	end
	puts b.current_board
	if b.is_finished == true
		puts "IEI! YOU WON!"
		break
	end
end
