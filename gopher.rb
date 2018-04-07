# frozen_string_literal: true
def next_coordinate(x, y, old_x, old_y, size)
  @map[x][y] = 1

  # @map.each do |row|
  #   puts row.join(' ')
  # end

  if x == old_x
    # We hit the desired row, so either retry or extend the line
    if y == old_y
      # We hit the desired point, decide the next point here
      counter = y
      while true do
        if @map[x][counter] == 0
          return [old_x + 1, counter + 1]
        else
          counter += 1
        end
      end
    else
      # We did not hit the desired point, retry
      [old_x + 1, old_y + 1]
    end
  else
    [old_x + 1, old_y + 1]
  end
end

num_tests = gets.chomp.to_i
# puts num_tests

num_tests.times do |test|
  size = gets.chomp.to_i
  @map = Array.new(1000) { Array.new(1000, 0) }
  # old_x = 4
  # old_y = 4
  old_x = 499
  old_y = 499
  result = []
  puts "#{old_x + 1} #{old_y + 1}"
  while true do
    STDOUT.flush
    line = gets.chomp.split
    x = line[0].to_i
    y = line[1].to_i

    exit if x == y && x == -1
    break if x == y && x == 0

    # puts "x - 1: #{x - 1}, y - 1: #{y - 1}, old_x: #{old_x}, old_y: #{old_y}"

    result = next_coordinate(x - 1, y - 1, old_x, old_y, size)
    puts result.join(' ')
    old_x = result[0] - 1
    old_y = result[1] - 1
  end
end
