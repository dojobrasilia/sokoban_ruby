require 'Sokoban'

describe Board do

	it 'should keep the board as it is' do
		
		board_st =   "###\n" +
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
	
	it "should go left considering player column" do
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

	it "should go left considering player line" do
	  board_st = "#####\n" +
			 	 "#   #\n" + 
			 	 "#  x#\n" + 
				 "#####"
		
	  board_st_result = "#####\n" +
			 	        "#   #\n" + 
			 	        "# x #\n" + 
				        "#####"
											
		b = Board.new(board_st)
		b.left
		b.current_board.should == board_st_result
	end
	
	it "should not go left through the wall" do
	  board_st = "#####\n" +
			 	 "#x  #\n" + 
				 "#####"
		
		b = Board.new(board_st)
		b.left
		b.current_board.should == board_st
	end
	
	it "should go right" do
	  board_st = "####\n" +
			 	 "#x #\n" + 
				 "####"
		
	  board_st_result = "####\n" +
			 	        "# x#\n" + 
				        "####"
											
		b = Board.new(board_st)
		b.right
		b.current_board.should == board_st_result
	end
	
	
	it "should go up" do
	    board_st =   "####\n" +
			     	 "#  #\n" + 
			     	 "#x #\n" + 
				     "####"

		  board_st_result = "####\n" +
				 	        "#x #\n" + 
				 	        "#  #\n" + 
					        "####"

			b = Board.new(board_st)
			b.up
			b.current_board.should == board_st_result
	end
	
	it "should go down" do
	    board_st =   "####\n" +
			     	 "#x #\n" + 
			     	 "#  #\n" + 
				     "####"

		  board_st_result = "####\n" +
				 	        "#  #\n" + 
				 	        "#x #\n" + 
					        "####"

			b = Board.new(board_st)
			b.down
			b.current_board.should == board_st_result
	end
	
	it "should walk down in a bigger board" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# x #\n" + 
			     	 "#   #\n" + 
				     "#####"

	    board_st_result = "#####\n" +
			 	        "#   #\n" + 
    			     	"#   #\n" + 
			 	        "# x #\n" + 
				        "#####"

		b = Board.new(board_st)
		b.down
		b.current_board.should == board_st_result
	end
	
	it "pushes the crate downward" do
	    board_st =   "#####\n" +
			     	 "# x #\n" + 
			     	 "# c #\n" + 
			     	 "#   #\n" + 
				     "#####"

	    board_st_result = "#####\n" +
			 	          "#   #\n" + 
    			     	  "# x #\n" + 
			 	          "# c #\n" + 
				          "#####"

		b = Board.new(board_st)
		b.down
		b.current_board.should == board_st_result
	end
	
	it "should not push the crate down against the wall" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# x #\n" + 
			     	 "# c #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.down
		b.current_board.should == board_st
	end
	
    it "pushes the crate upwards" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# c #\n" + 
			     	 "# x #\n" + 
				     "#####"

	    board_st_result = "#####\n" +
			 	          "# c #\n" + 
    			     	  "# x #\n" + 
			 	          "#   #\n" + 
				          "#####"

		b = Board.new(board_st)
		b.up
		b.current_board.should == board_st_result
	end
	
	it "should not push the crate up against the wall" do
	    board_st =   "#####\n" +
			     	 "# c #\n" + 
			     	 "# x #\n" + 
			     	 "#   #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.up
		b.current_board.should == board_st
	end
	
	
	it "pushes the crate right" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "#xc #\n" + 
			     	 "#   #\n" + 
				     "#####"

	    board_st_result = "#####\n" +
			 	          "#   #\n" + 
    			     	  "# xc#\n" + 
			 	          "#   #\n" + 
				          "#####"

		b = Board.new(board_st)
		b.right
		b.current_board.should == board_st_result
	end
	
	it "should not push the crate right against the wall" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# xc#\n" + 
			     	 "#   #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.right
		b.current_board.should == board_st
	end
	
	it "pushes the crate to the left" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# cx#\n" + 
			     	 "#   #\n" + 
				     "#####"

	    board_st_result = "#####\n" +
			 	          "#   #\n" + 
    			     	  "#cx #\n" + 
			 	          "#   #\n" + 
				          "#####"

		b = Board.new(board_st)
		b.left
		b.current_board.should == board_st_result
	end
	
	it "should not push the crate to the left against the wall" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "#cx #\n" + 
			     	 "#   #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.left
		b.current_board.should == board_st
	end
	
	it "should not push the crate down over another crate" do
	    board_st =   "#####\n" +
			     	 "# x #\n" + 
			     	 "# c #\n" + 
			     	 "# c #\n" + 
			     	 "#   #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.down
		b.current_board.should == board_st
	end
	
	it "should not push the crate up over another crate" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# c #\n" + 
			     	 "# c #\n" + 
			     	 "# x #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.up
		b.current_board.should == board_st
	end
	
	it "should recognize a crate on top of a goal" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# . #\n" + 
			     	 "# c #\n" + 
			     	 "# x #\n" + 
				     "#####"
				     
		board_st_result =    "#####\n" +
						 	 "#   #\n" + 
						 	 "# o #\n" + 
						 	 "# x #\n" + 
						 	 "#   #\n" + 
							 "#####"

		b = Board.new(board_st)
		b.up
		b.current_board.should == board_st_result
	end
	
	it "should recognize a player on top of a goal" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# . #\n" + 
			     	 "# x #\n" + 
			     	 "#   #\n" + 
				     "#####"
				     
		board_st_result =    "#####\n" +
						 	 "#   #\n" + 
						 	 "# x #\n" + 
						 	 "#   #\n" + 
						 	 "#   #\n" + 
							 "#####"

		b = Board.new(board_st)
		b.up
		b.current_board.should == board_st_result
		b.down
		b.current_board.should == board_st
	end
	
	it "should recognize a player on top of a goal" do
	    board_st =   "#####\n" +
			     	 "# . #\n" + 
			     	 "# . #\n" + 
			     	 "# x #\n" + 
			     	 "#   #\n" + 
				     "#####"
				     
		board_st_result =    "#####\n" +
						 	 "# .x#\n" + 
						 	 "# . #\n" + 
						 	 "#   #\n" + 
						 	 "#   #\n" + 
							 "#####"

		b = Board.new(board_st)
		b.up
		b.up
		b.right
		b.current_board.should == board_st_result
	end
	
	it "should not remove a crate when exiting a goal" do
	    board_st =   "#####\n" +
			     	 "#   #\n" + 
			     	 "# . #\n" + 
			     	 "# c #\n" + 
			     	 "# x #\n" + 
				     "#####"
				     
		board_st_result =    "#####\n" +
						 	 "# c #\n" + 
						 	 "# x #\n" + 
						 	 "#   #\n" + 
						 	 "#   #\n" + 
							 "#####"

		b = Board.new(board_st)
		b.up
		b.up
		b.current_board.should == board_st_result
	end

	it "should not lose that a crate is above a goal after a second movement" do
	    board_st =   "#####\n" +
			     	 "# . #\n" + 
			     	 "# . #\n" + 
			     	 "# c #\n" + 
			     	 "# x #\n" + 
				     "#####"
				     
		board_st_result =    "#####\n" +
						 	 "# o #\n" + 
						 	 "# x #\n" + 
						 	 "#   #\n" + 
						 	 "#   #\n" + 
							 "#####"

		b = Board.new(board_st)
		b.up
		b.up
		b.current_board.should == board_st_result
	end
	
	it "should be fail by default" do
	    board_st =   "#####\n" +
			     	 "#c. #\n" + 
			     	 "# x #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.is_finished.should == false
	end
	
	it "should win with a single achievable goal" do
	    board_st =   "#####\n" +
			     	 "# . #\n" + 
			     	 "# c #\n" + 
 			     	 "# x #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.up
		b.is_finished.should == true
	end
	
	it "should win with a single achievable goal in another goal point" do
	    board_st =   "#####\n" +
			     	 "#   #\n" +
			     	 "# . #\n" + 
			     	 "# c #\n" + 
 			     	 "# x #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.up
		b.is_finished.should == true
	end
		
	it "should not win when there are more crates to put into goals" do
	    board_st =   "#####\n" +
			     	 "#   #\n" +
			     	 "# ..#\n" + 
			     	 "# cc#\n" + 
 			     	 "# x #\n" + 
				     "#####"

		b = Board.new(board_st)
		b.up
		b.down
		b.right
		b.is_finished.should == false
	end
	
end
