require 'Sokoban'

describe Board do

	it 'should keep the board as it is' do
		
		board_st = "###\n" +
						 	 "# #\n" + 
							 "###"
						
		b = Board.new(board_st)
		
		b.current_board.should == board_st
		
	end

end