class Tile
  attr_accessor :status, :has_bomb
  attr_reader :board

  def initialize(board)

    @board = board
    @has_bomb = false
    @status = "not_exp"
  end


end
