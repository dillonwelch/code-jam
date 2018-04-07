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

def hack(commands, shield)
  total_damage = evaluate(commands)
  if total_damage > shield
    # TODO hack
  else
    return true
  end
end



puts "Case #1: #{hack('CS', 2)}"
