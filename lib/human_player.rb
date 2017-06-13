class HumanPlayer

  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Where do you want to place your mark?"
    input = gets.chomp
    input.split(",").map!(&:to_i)
  end

  def display(board) 
    p board.board
  end

end
