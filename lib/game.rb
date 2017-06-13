require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_reader :board, :current_player

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @board = Board.new
    @current_player = player_one
  end

  def play_turn
    move = @current_player.get_move
    @board.place_mark(move, @current_player.mark)
    switch_players!
  end

  def switch_players!
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end
  
end
