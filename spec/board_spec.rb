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
    it "returns true" do
      valid_entry = 3
      turn = board.valid_move?(valid_entry)
      expect(turn).to be true
    end

    it "returns false" do 
      invalid_entry = 42
      turn = board.valid_move?(invalid_entry)
      expect(turn).to be false
    end
  end

end