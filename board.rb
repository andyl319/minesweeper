require_relative "tile"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) {Tile.new(self)} }
    drop_bombs
  end

  def random_pos
    [rand(9), rand(9)]
  end

  def drop_bombs
    20.times do
      pos = random_pos
      pos = random_pos until self[pos].has_bomb == false
      self[pos].has_bomb = true
      update_bomb_count(pos)
    end
  end

  def neighbor_positions(pos)
    row, col = pos
    result = []
    (row - 1..row + 1).each do |i|
      (col-1..col + 1).each do |j|
        neighbor_pos = [i, j]
        if neighbor_pos.all? { |e| (0..8).cover?(e) }
          result << neighbor_pos
        end
      end
    end
    result
  end

  def update_bomb_count(pos)
    neighbor_positions(pos).each do |neighbor|
      self[neighbor].neighbor_bombs += 1
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

  def render
  puts "  "+ (0..8).to_a.join(" ")
  grid.each_with_index do |row, i|
    puts "#{i} #{row.map(&:render).join(" ")}"
  end
end

end
