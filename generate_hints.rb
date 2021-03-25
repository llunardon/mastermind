def generate_code(n)
  possible_colors = ["black", "white", "red", "blue", "yellow", "green", "orange", "purple"]
  puts "possible colors: " + possible_colors.join(', ')
  code = []
  until code.length == n do
    code.push(color = possible_colors.sample)
    possible_colors.delete(color)
  end

  code
end

def generate_hints(code, guess)
  hints = []

  guess.uniq.each_with_index do |color, index|
    if color == code[index]
      hints.push("green")
    elsif code.include?(color) 
      hints.push("white")
    end
  end

  puts 'hints: ' + hints.join(', ')
  if right_guess?(hints, code.length)
    puts 'You won! Congratulations.'
    exit
  end
end

def right_guess?(hints, len)
  (hints.uniq)[0] = "green" && hints.length == len && hints.uniq.length == 1
end

def get_guess(n)
  puts 'Insert your guess: '
  until (guess = gets.chomp.split(' ')).length == n
    #puts 'Try to guess the four-color code. Use WHITESPACES to delimit words, and watch for TYPOS! '
    puts 'Insert your guess: '
  end

  guess
end

puts '*******************************************************************************************'
puts '*Try to guess the four-color code. Use WHITESPACES to delimit words, and watch for TYPOS! *'
puts '*******************************************************************************************'
code = generate_code(4)
p code
(1..12).each do
  generate_hints(code, get_guess(4))
end
