require 'Sokoban'

describe Board do

	it 'should keep the board as it is' do
		
		board_st = "###\n" +
						 	 "# #\n" + 
							 "###"
						
		b = Board.new(board_st)
		
		b.current_board.should == board_st
		
	end

	it "should go left" do
	  board_st = "####\n" +
						 	 "# x#\n" + 
							 "####"
		
	  board_st_result = "####\n" +
						 	        "#x #\n" + 
							        "####"
											
		b = Board.new(board_st)
		b.left
		b.current_board.should == board_st_result
	end
	
	it "should go left considering player position" do
	  board_st = "#####\n" +
						 	 "#  x#\n" + 
							 "#####"
		
	  board_st_result = "#####\n" +
						 	        "# x #\n" + 
							        "#####"
											
		b = Board.new(board_st)
		b.left
		b.current_board.should == board_st_result
	end
	
end