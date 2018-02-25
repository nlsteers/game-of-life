class Cell
  # getter and setter generators
  attr_accessor :is_alive, :row, :col

  # called on new, initializes instance variables
  # @param [int] row
  # @param [int] col
  def initialize(row, col)
    @row = row
    @col = col
    @is_alive = false
  end

  # checks a cells alive state, evaluates true if cell is alive
  def alive?
    is_alive ? true : false
  end

  # checks a cells alive state, evaluates true if cell is dead
  def dead?
    !is_alive ? true : false
  end

  # sets a cells alive state to false
  def dead!
    @is_alive = false
  end

  # sets a cells alive state to true
  def alive!
    @is_alive = true
  end
end
