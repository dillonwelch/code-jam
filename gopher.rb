# frozen_string_literal: true
def next_coordinate(x, y, size)
  @map[x][y] = 1
end

num_tests = gets.chomp.to_i

num_tests.times do |test|
  size = gets.chomp.to_i
  @map = Array.new(1000) { Array.new(1000, 0) }
  old_x = 499
  old_y = 499
  result = []
  puts "500 500"
  while true do
    line = gets.chomp.split
    x = line[0].to_i
    y = line[1].to_i
    exit if x == y && x == -1
    break if x == y && x == 0
    result = next_coordinate(x - 1, y - 1, size)
    puts result.join(' ')
    old_x = x
    old_y = y
  end
end
