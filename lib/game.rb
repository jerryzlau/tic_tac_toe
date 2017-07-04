require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_reader :player_one, :player_two, :current_player
  attr_accessor :mark, :board

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    player_one.mark = :X
    player_two.mark = :O
    @board = Board.new
    @current_player = player_one
  end

  # def play_turn
  #   move = @current_player.get_move
  #   @board.place_mark(move, @current_player.mark)
  #   switch_players! if board.winner.nil?
  # end

  def play_turn
    current_player.display(board)
    move = current_player.get_move
    @board.place_mark(move, current_player.mark)
    switch_players! if board.winner.nil?
  end

  def switch_players!
    if @current_player == @players[0]
      @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end

  def play
    while board.winner.nil?
      play_turn
    end

    if board.winner
      puts "The winner is #{@current_player.name}!"
    else
      puts "It's a tie!"
    end
  end

end

if $0 == __FILE__
  puts "Welcome to my Tic Tac Toe!"
  puts "What's your name?"
  player1 = HumanPlayer.new(gets.chomp)
  player2 = ComputerPlayer.new
  game = Game.new(player1, player2)
  game.play
end
