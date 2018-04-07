# frozen_string_literal: true

def evaluate(commands)
  damage = 1
  total_damage = 0

  commands.each do |command|
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
    if commands.length == 2
      result = [commands[1], commands[0]]
      if evaluate(result) > shield
        return false
      else
        return result
      end
    end
  else
    return 0
  end
end

def number_of_hacks(commands, shield, case_number)
  counter = 0
  while true
    result = hack(commands, shield)
    if result.is_a? Array
      counter += 1
      commands = result
    else
      case result
      when 0
        puts "Case ##{case_number}: #{counter}"
        return
      when false
        puts "Case ##{case_number}: IMPOSSIBLE"
        return
      end
    end
  end
end

number_of_hacks('CS'.split(''), 1, 1)
number_of_hacks('CS'.split(''), 2, 2)
