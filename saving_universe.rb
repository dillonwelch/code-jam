# frozen_string_literal: true

def evaluate(commands)
  arr = commands.split('')
  damage = 1
  total_damage = 0

  arr.each do |command|
    if command == 'S'
      total_damage += damage
    else
      damage = damage * 2
    end
  end

  total_damage
end

puts evaluate 'SCCSSC'
