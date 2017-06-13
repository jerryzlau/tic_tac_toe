require "byebug"
class ComputerPlayer

  attr_reader :board
  attr_accessor :mark

  def initialize(name="AI")
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    wins = @board.winning_moves(@mark)
    random_moves = @board.valid_move
    if wins.empty?
      random_moves.sample
    else
      wins.sample
    end
  end

end
