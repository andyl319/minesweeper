require_relative "tile"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) {Tile.new(self)} }
    populate(@grid)
  end

  def random_pos
    [rand(9), rand(9)]
  end

  def drop_bombs
    30.times do
      pos = random_pos
      pos = random_pos until self[pos].has_bomb == false
      self[pos].has_bomb = true
    end
  end

  def populate(grid)
    @grid.each do |row|
      row.each do |tile|
        
      end
    end

  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, status)
    x, y = pos
    tile = grid[x][y]
    tile.status = status
  end

end
