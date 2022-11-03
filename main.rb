require_relative "game"
require_relative "board" 
require_relative "player"
require_relative "text"

def play_game
  game = Game.new
  game.play
  game.repeat_game
end



play_game