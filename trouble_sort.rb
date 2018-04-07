# frozen_string_literal: true

def trouble_sort(list)
  done = false
  while not done
    done = true
    list[0..list.length-3].each_with_index do |val, i|
      if val > list[i+2]
        done = false
        list[i] = list[i+2]
        list[i+2] = val
      end
    end
  end
  list
end

def validate_result(list, case_number)
  list[0..list.length-2].each_with_index do |val, i|
    if val > list[i+1]
      puts "Case ##{case_number}: #{i}"
      return
    end
  end
  puts "Case ##{case_number}: OK"
end

puts validate_result(trouble_sort([5,6,8,4,3]), 1)
puts validate_result(trouble_sort([8,9,7]), 2)
