def generate_hints(code, guess)
  hints = []

  guess.each_with_index do |color, index|
    if color == code[index]
      hints.push("green")
    elsif code.include?(color)
      hints.push("white")
    end
  end

  puts 'hints: ' + hints.join(', ')
  if hints.uniq.size == 1
    puts 'You won! Congratulations.'
    exit
  end
end

def get_guess 
  puts 'Insert your guess: '
  until (guess = gets.chomp.split(' ')).length == 4
    #puts 'Try to guess the four-color code. Use WHITESPACES to delimit words, and watch for TYPOS! '
    puts 'Insert your guess: '
  end

  guess
end

p code = ["orange", "blue", "red", "purple"]

guess = get_guess
p generate_hints(code, guess)

