class Board

  attr_accessor :grid

  def initialize(grid=nil)
    if grid != nil
      @grid = grid
    else
      @grid = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
    end
  end

  def board
    @grid
  end

  def place_mark(pos, mark)
    x, y = pos
    @grid[x][y] = mark
  end

  def empty?(pos)
    x, y = pos
    @grid[x][y] == nil
  end

  def winner
    #check rows
    @grid.each do |row|
      return row.first if row.all? {|el| row.first == el && !el.nil?}
    end

    #check lefit diagonal
    compare = []
    (0..@grid.size-1).each do |idx|
      compare << @grid[idx][idx]
    end
    return compare.first if compare.all? {|el| compare.first == el && !el.nil?}

    #check right diagonal
    compare = []
    (0..@grid.size-1).each do |idx|
      compare << @grid[@grid.size-1-idx][idx]
    end
    return compare.first if compare.all? {|el| compare.first == el && !el.nil?}

    #check columns
    @grid.transpose.each do |col|
      return col.first if col.all? {|el| col.first == el && !el.nil?}
    end

    nil
  end

  def over?
    winner ? true : @grid.flatten.compact == @grid.flatten
  end

  def winning_moves(mark)
    wins = []
    length = @grid.size-1
    (0..length).each do |arr|
      (0..length).each do |pos|
        if @grid[arr][pos].nil?
          place_mark([arr,pos], mark)
          wins << [arr,pos] if winner == mark
          @grid[arr][pos] = nil
        end
      end
    end
    wins
  end

  def valid_move
    moves = []
    length = @grid.size-1
    (0..length).each do |arr|
      (0..length).each do |pos|
        if @grid[arr][pos].nil?
          moves << [arr,pos]
        end
      end
    end
    moves
  end

  #made this to display a playable game
  # def display
  #   puts "---------------"
  #   (0..@grid.length-1).each do |idx|
  #     p @grid[idx].join(" | ")
  #     puts "---------------"
  #   end
  # end

end
