# frozen_string_literal: true
def next_coordinate(x, y, size)
  'hi'
end

num_tests = gets.chomp.to_i

num_tests.times do |test|
  size = gets.chomp.to_i
  puts "500 500"
  while true do
    line = gets.chomp.split
    x = line[0].to_i
    y = line[1].to_i
    exit if x == y && x == -1
    break if x == y && x == 0
    puts next_coordinate(x, y, size)
  end
end
