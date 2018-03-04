Dir['./classes/*.rb'].each do |file|
  require file
end

# Beacon (period 2)
game_of_life = Game.new(Grid.new(6, 6), [[1, 1], [1, 2], [2, 1],
                                         [3, 4], [4, 4], [4, 3]])

# Blinker
#game_of_life = Game.new(Grid.new(5, 5), [[1, 2], [2, 2], [3, 2]])

#game_of_life = Game.new(Grid.new(5, 5))
puts 'Starting the Game of Life'
puts 'Press enter to end the game'
sleep 0.5

# create a new thread
t = Thread.new do
  count = 1
  loop do
    puts '------'
    puts "Generation #{count}"
    puts '------'
    game_of_life.grid.print_grid
    break if game_of_life.tick!
    sleep 0.5
    count += 1
  end
end

# kill thread on enter
gets
t.kill

