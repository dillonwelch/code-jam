# frozen_string_literal: true
def next_coordinate(x, y, old_x, old_y, size)
  @map[x][y] = 1

  File.open('results.txt', 'w') do |f|
    @map.each do |row|
      f << row.join(' ') << "\n"
    end
  end

  if rectangle_around_point?(old_x, old_y)
    [old_x + 2, old_y + 1]
  else
    # Have not made a complete rectangle around the point
    [old_x + 1, old_y + 1]
  end
end

def rectangle_around_point?(old_x, old_y)
  (-1..1).each do |row|
    (-1..1).each do |cell|
      if @map[old_x + row][old_y + cell] == 0
        return false
      end
    end
  end
  true
end

#   if x == old_x
#     # We hit the desired row, so either retry or extend the line
#     if y == old_y
#       # We hit the desired point, decide the next point here
#       decide_next_point
#     else
#       # We did not hit the desired point, retry
#       [old_x + 1, old_y + 1]
#     end
#   else
#     [old_x + 1, old_y + 1]
#   end
# end
#
# def decide_next_point(counter=0)
#   # TODO optimize because this re-checks 0..n-1
#   (0..counter).each do |x_counter|
#     (0..counter).each do |y_counter|
#       if @map[@old_x + x_counter][@old_y + y_counter] == 0
#         return [@old_x + x_counter + 1, @old_y + y_counter + 1]
#       end
#     end
#   end
#   decide_next_point(counter + 1)
# end

num_tests = gets.chomp.to_i
# puts num_tests

num_tests.times do |test|
  size = gets.chomp.to_i
  # @map = Array.new(50) { Array.new(50, 0) }
  @map = Array.new(200) { Array.new(200, 0) }
  old_x = 20
  old_y = 20
  # @map = Array.new(1000) { Array.new(1000, 0) }
  # old_x = 499
  # old_y = 499
  @old_x = old_x
  @old_y = old_y
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
