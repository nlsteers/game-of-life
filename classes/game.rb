class Game
  # getter and setter generators
  attr_accessor :grid, :pattern

  def initialize(grid = Grid.new, pattern = [])
    @grid = grid
    # iterate through provided seed pattern
    pattern.each do |p|
      x = p[0]
      y = p[1]
      grid.grid[x][y].alive!
    end
  end

  def tick!
    alive_cells = []
    dead_cells = []

    @grid.cells.each do |cell|
      # check each cells neighbours for alive cells
      neighbour_count = grid.check_surrounding_cells(cell).count

      # anything alive with fewer than two live neighbours dies
      dead_cells.push(cell) if cell.alive? && (neighbour_count < 2)

      # anything alive with two or three alive neighbours lives on to the next generation
      if cell.alive? && (neighbour_count == 2 || neighbour_count == 3)
        alive_cells.push(cell)
      end

      # anything alive with more than three alive neighbours dies
      dead_cells.push(cell) if cell.alive? && (neighbour_count > 3)

      # anything dead with exactly three live neighbours becomes a live cell
      alive_cells.push(cell) if cell.dead? && (neighbour_count == 3)
    end

    # set all cells in this array to alive
    alive_cells.each(&:alive!)
    # set all cells in this array to dead
    dead_cells.each(&:dead!)
  end
end
