class Grid
  # getter and setter generators
  attr_accessor :cells, :no_rows, :no_columns, :grid, :cell_neighbours

  # called on new, initializes instance vars
  # @param [int] rows
  # @param [int] columns
  def initialize(rows = 5, columns = 5)
    @no_rows = rows
    @no_columns = columns
    @cells = []
    @cell_neighbours = []
    @grid = Array.new(no_rows) do |row|
      Array.new(no_columns) do |col|
        cell = Cell.new(row, col)
        cells.push(cell)
        cell
      end
    end
  end

  # check the cell above the current cell
  def look_up(cell)
    # don't look if the cell is already on the top row
    if cell.row > 0
      target = grid[cell.row - 1][cell.col]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell below the current cell
  def look_down(cell)
    # don't look if the cell is already on the bottom row
    if cell.row < (no_rows - 1)
      target = grid[cell.row + 1][cell.col]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell to the right of the current cell
  def look_right(cell)
    # don't look if the cell is already at the right edge of the grid
    if cell.col < (no_columns - 1)
      target = grid[cell.row][cell.col + 1]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell to the left of the current cell
  def look_left(cell)
    # don't look if the cell is already at the left edge of the grid
    if cell.col > 0
      target = grid[cell.row][cell.col - 1]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell diagonally up and to the left of the current cell
  def look_up_and_left(cell)
    # don't look if the cell is already at the left edge of the grid and on the top row
    if cell.row > 0 && cell.col > 0
      target = grid[cell.row - 1][cell.col - 1]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell diagonally up and to the right of the current cell
  def look_up_and_right(cell)
    # don't look if the cell is already at the right edge of the grid and on the top row
    if cell.row > 0 && cell.col < (no_columns - 1)
      target = grid[cell.row - 1][cell.col + 1]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell diagonally down and to the left of the current cell
  def look_down_and_left(cell)
    # don't look if the cell is already at the left edge of the grid and on the bottom row
    if cell.row < (no_rows - 1) && cell.col > 0
      target = grid[cell.row + 1][cell.col - 1]
      cell_neighbours.push(target) if target.alive?
    end
  end

  # check the cell diagonally down and to the right of the current cell
  def look_down_and_right(cell)
    # don't look if the cell is already at the right edge of the grid and on the bottom row
    if cell.row < (no_rows - 1) && cell.col < (no_columns - 1)
      target = grid[cell.row + 1][cell.col + 1]
      cell_neighbours.push(target) if target.alive?
    end
  end


  # @param [Object] cell
  # @return [Array] cell_neighbours
  def check_surrounding_cells(cell)
    @cell_neighbours = []

    look_up(cell)
    look_down(cell)
    look_left(cell)
    look_right(cell)
    look_up_and_left(cell)
    look_up_and_right(cell)
    look_down_and_left(cell)
    look_down_and_right(cell)

    @cell_neighbours
  end

  # prints the current state of the game to the terminal
  def print_grid
    grid.each do |row|
      row.each do |cell|
        if cell.alive?
          print '0'
        else
          print '.'
        end
      end
      print "\n"
    end
  end
end
