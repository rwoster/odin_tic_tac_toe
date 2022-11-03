require_relative "text"

class Game
  include Text
  attr_reader :first_player, :second_plaer, :board, :current_player

  def initialize
    @board = Board.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def play
    game_set_up
    board.show_board
    player_turns
    conclusion
  end

  def create_player(number, duplicate_symbol = nil)
    puts text_player_name(number)
    name = gets.chomp
    symbol = symbol_input(duplicate_symbol)
    Player.new(name, symbol)
  end

  def turn(player)
    cell = turn_input(player)
    board.update_board(cell - 1, player.symbol)
    board.show_board
  end

  def repeat_game
    puts "Would you like to play a new game? Enter 'yes' or 'no'?"
    repeat_input = gets.chomp.downcase
    
    if repeat_input == 'yes'
      play_game 
    elsif repeat_input == 'no'
      puts "Thanks for playing"
    else
      puts "Please enter either 'yes' or 'no'."
      repeat_game
    end
  end
  
  private

  def game_set_up
    puts text_intro
    @first_player = create_player(1)
    @second_player = create_player(2, first_player.symbol)
  end

  def symbol_input(duplicate)
    player_symbol_prompts(duplicate)
    input = gets.chomp
    return input if input.match?(/^[^0-9]$/) && input != duplicate
  
    puts text_first_symbol
    symbol_input(duplicate)
  end

  def player_symbol_prompts(duplicate)
    puts text_get_symbol
    puts text_first_symbol(duplicate) if duplicate
  end

  def player_turns
    @current_player = first_player
    until board.full?
      turn(current_player)
      break if board.game_over?

      @current_player = switch_current_player
    end
  end

  def turn_input(player)
    puts text_player_turn(player.name, player.symbol)
    number = gets.chomp.to_i
    return number if board.valid_move?(number)

    puts number.class

    puts text_invalid_entry
    turn_input(player)
  end

  def switch_current_player
    current_player == @first_player ? @second_player : @first_player
  end

  def conclusion
    if board.game_over?
      puts text_winner(current_player.name)
    else
      puts text_tie
    end
  end

  
end