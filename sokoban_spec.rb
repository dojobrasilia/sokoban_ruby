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

	    board_st_result = "#####\n" +
			 	          "#   #\n" + 
    			     	  "# x #\n" + 
			 	          "# c #\n" + 
				          "#####"

		b = Board.new(board_st)
		b.down
		b.current_board.should == board_st_result
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

	    board_st_result = "#####\n" +
			 	          "# c #\n" + 
    			     	  "# x #\n" + 
			 	          "#   #\n" + 
				          "#####"

		b = Board.new(board_st)
		b.up
		b.current_board.should == board_st_result
	end
	
	
end
