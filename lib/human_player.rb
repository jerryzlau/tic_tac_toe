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
    print "-" * board.grid.length * 12
    puts ""
    board.grid.each do |row|
      row.each do |pos|
        if !pos.nil?
          print " | #{pos} | "
        else
          print " |   | "
        end
      end
      print "\n"
    end
    print "-" * board.grid.length * 12
    print "\n"
  end

end
