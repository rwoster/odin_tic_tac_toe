require_relative "../board.rb"

describe Board do
  subject(:board) { described_class.new }
  
  describe "#initialize" do
    it "returns @cells" do
      expect(board.cells).to eql([1,2,3,4,5,6,7,8,9])
    end
  end

  describe "#show_board" do
    # no test needed, just puts the board
  end

  describe "#update_board" do
    it "updates cell 3 with symbol 'X'" do
      number = 3
      symbol = 'X'
      result = board.update_board(number, symbol)
      cell3 = board.cells[3]
      expect(cell3).to eql('X')
    end

    it "updates cell 0 with symbol 'O'" do
      number = 0
      symbol = 'O'
      result = board.update_board(number, symbol)
      cell0 = board.cells[0]
      expect(cell0).to eql('O')
    end
  end

  describe "#valid_move?" do
    context "when the move is valid" do
      it "returns true" do
        valid_entry = 3
        turn = board.valid_move?(valid_entry)
        expect(turn).to be true
      end
    end

    context "when the move is invalid" do
      it "returns false for out of range move" do 
        invalid_entry = 42
        turn = board.valid_move?(invalid_entry)
        expect(turn).to be false
      end
      
      it "returns false for attempt to move on occupied space" do
        board.instance_variable_set(:@cells, [1,2,'X',4,5,6,7,8,9])
        occupied_cell = 3
        turn = board.valid_move?(occupied_cell)
        expect(turn).to be false
      end
    end
  end

  describe "#full?" do
    context "when the board is not full (new board)" do
      it "returns false" do
        expect(board).not_to be_full
      end
    end
    
    context "when the board is mid game" do
      before do
        board.instance_variable_set(:@cells, [1, 'x', 3, 'o', 5, 'x', 'x', 8, 'o'])
      end
      
      it "returns false" do
        expect(board).not_to be_full
      end
    end
    
    context "when the board is full" do
      before do
        board.instance_variable_set(:@cells, %w[x o x x o x o x o])
      end
      
      it "returns true" do
        expect(board).to be_full
      end
    end
  end

  describe "#game_over?" do
    context "when the game is not over" do
      before do
        board.instance_variable_set(:@cells, [1,2,3,"X",5,"O",7,8,9]) 
      end

      it "returns false" do
        expect(board).not_to be_game_over  
      end
    end

    context "when the game is over, with vertical win" do
      before do
        board.instance_variable_set(:@cells, ["X",2,3,"X",5,6,"X",8,9]) 
      end

      it "returns true" do
        expect(board).to be_game_over  
      end
    end

    context "when the game is over, with horizontal win" do
      before do
        board.instance_variable_set(:@cells, ["O","O","O",4,5,6,7,8,9]) 
      end

      it "returns true" do
        expect(board).to be_game_over  
      end
    end

    context "when the game is over, with diagonal win" do
      before do
        board.instance_variable_set(:@cells, ["X",2,3,4,"X",6,7,8,"X"]) 
      end

      it "returns true" do
        expect(board).to be_game_over  
      end
    end
    
  end

end