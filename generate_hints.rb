# frozen_string_literal: true

def generate_code(num)
  possible_colors = %w[black white red blue yellow green orange purple]
  puts "possible colors: #{possible_colors.join(', ')}"
  code = []
  until code.length == num
    code.push(color = possible_colors.sample)
    possible_colors.delete(color)
  end

  code
end

def generate_hints(code, guess)
  hints = []

  guess.uniq.each_with_index do |color, index|
    if color == code[index]
      hints.push('green')
    elsif code.include?(color)
      hints.push('white')
    end
  end

  puts "hints: #{hints.join(', ')}"
  puts ''
  if right_guess?(hints, code.length)
    puts 'You won! Congratulations.'
    exit
  end
end

def right_guess?(hints, len)
  hints.include?('green') && hints.length == len && hints.uniq.length == 1
end

def get_guess(num)
  puts 'Insert your guess: '
  puts ''
  until (guess = gets.chomp.split(' ')).length == num
    # puts 'Try to guess the four-color code. Use WHITESPACES to delimit words, and watch for TYPOS! '
    puts 'Insert your guess: '
  end

  guess
end

def play_game
  puts '*******************************************************************************************'
  puts '*Try to guess the four-color code. Use WHITESPACES to delimit words, and watch for TYPOS! *'
  puts '*The code doesn\'t have repeated colors!                                                   *'
  puts '*Hints legend:                                                                            *'
  puts '* green: right color and right position                                                   *'
  puts '* white: right color and wrong position                                                   *'
  puts '*******************************************************************************************'
  code = generate_code(4)
  #p code
  12.times do
    generate_hints(code, get_guess(4))
  end
end

play_game
