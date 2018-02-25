Dir['./classes/*.rb'].each do |file|
  require file
end
require 'rspec'

describe 'the game' do

  it 'should initialize a grid properly' do
    g = Grid.new(3, 3)
    expect(g.grid[1][1].alive?).to eq false
  end

  it 'should activate a dead cell' do
    g = Grid.new(3, 3)
    expect(g.grid[1][1].alive?).to eq false
    g.grid[1][1].alive!
    expect(g.grid[1][1].alive?).to eq true
  end

  it 'should see an alive cell to the left' do
    g = Game.new(Grid.new(3, 3), [[1, 0]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should see an alive cell to the right' do
    g = Game.new(Grid.new(3, 3), [[1, 2]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should see an alive cell above' do
    g = Game.new(Grid.new(3, 3), [[0, 1]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should see an alive cell below' do
    g = Game.new(Grid.new(3, 3), [[2, 1]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should see an alive cell below and to the left' do
    g = Game.new(Grid.new(3, 3), [[2, 0]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should see an alive cell below and to the right' do
    g = Game.new(Grid.new(3, 3), [[2, 2]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should see an alive cell above and to the left' do
    g = Game.new(Grid.new(3, 3), [[0, 0]])
    c = g.grid.grid[1][1]
    expect(g.grid.cell_neighbours.count).to eq 0
    g.grid.check_surrounding_cells(c)
    expect(g.grid.cell_neighbours.count).to eq 1
  end

  it 'should respect rule 1' do
    g = Game.new(Grid.new(3, 3), [[1, 1]])
    expect(g.grid.grid[1][1].alive?).to eq true
    g.tick!
    expect(g.grid.grid[1][1].alive?).to eq false
  end

  it 'should respect rule 2' do
    g = Game.new(Grid.new(3, 3), [[0, 1], [0, 2], [1, 1]])
    expect(g.grid.grid[1][1].alive?).to eq true
    g.tick!
    expect(g.grid.grid[1][1].alive?).to eq true
  end

  it 'should respect rule 3' do
    g = Game.new(Grid.new(3, 3), [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1]])
    expect(g.grid.grid[1][1].alive?).to eq true
    g.tick!
    expect(g.grid.grid[1][1].alive?).to eq false
  end

  it 'should respect rule 4' do
    g = Game.new(Grid.new(3, 3), [[0, 0], [0, 1], [0, 2]])
    expect(g.grid.grid[1][1].alive?).to eq false
    g.tick!
    expect(g.grid.grid[1][1].alive?).to eq true
  end
end