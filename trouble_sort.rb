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

puts trouble_sort([5,6,6,4,3])
