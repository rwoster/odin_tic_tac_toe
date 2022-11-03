module Text

  # START GAME PROMPT
  def text_intro
    "Welcome to CLI Tic-Tac-Toe."
  end

  # GET PLAYER NAME
  def text_player_name(number)
    "Name for player ##{number}?"
  end

  # GET PLAYER SYMBOL
  def text_get_symbol
    "Pick a single character for player's marker."
  end

  # CHECK FOR DUPLICATE SYMBOL
  def text_first_symbol(duplicate)
    "Can't be #{duplicate}"
  end

  # INVALID ENTRY
  def text_invalid_entry
    # "Whoops! That was an invalid entry"
    "\e[31mSorry, that is an invalid answer. Please, try again.\e[0m"
  end

  # PLAYER TURN
  def text_player_turn(player, symbol)
    "#{player}'s turn... enter an open position on the board for the #{symbol}."
  end

  # WINNING MESSAGE
  def text_winner(player)
    "#{player} wins"
  end
  
  # DRAW
  def text_draw
    "It's a draw."
  end

end