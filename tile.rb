class Tile
  attr_accessor :status, :has_bomb, :neighbor_bombs
  attr_reader :board, :revealed, :flagged

  def initialize(board)
    @board = board
    @has_bomb = false
    @revealed = false
    @flagged = false
    @neighbor_bombs = 0
  end

  def render
    if @revealed == false
      @flagged == true ? "F" : "*"
    else
      @neighbor_bombs == 0 ? "_" : @neighbor_bombs.to_s
    end
  end

end
