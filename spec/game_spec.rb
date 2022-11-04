require_relative "../game.rb"
require_relative "../board.rb"
require_relative "../player.rb"

describe Game do

  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
  end
  
  describe "#play" do
    it "runs main game loop" do
      allow(game).to receive(:game_set_up)
      allow(game).to receive(:player_turns)
      allow(game).to receive(:conclusion)
      expect(game.board).to receive(:show_board)
      game.play
    end
  end

  describe "#create_player" do
    it "creates a player" do
      name = 'Satoshi'
      symbol = "₿"
      allow(game).to receive(:puts)
      allow(game).to receive(:text_player_name).with(1)
      allow(game).to receive(:gets).and_return(name)
      allow(game).to receive(:symbol_input).and_return(symbol)
      expect(Player).to receive(:new).with(name, symbol)
      game.create_player(1)
    end
  end

  describe "#turn" do
    let(:symbol) { "₿" }
    let(:turn) { 4 }
    let(:mock_player) { instance_double(Player, :symbol => symbol) }
    
    before do
      game.instance_variable_set(:@first_player, mock_player)
    end    
    
    it "runs turn loop" do
      allow(game).to receive(:turn_input).with(game.first_player).and_return(turn)
      allow(game.board).to receive(:show_board)
      expect(game.board).to receive(:update_board).with(turn - 1, symbol)
      game.turn(game.first_player)
    end
  end
end