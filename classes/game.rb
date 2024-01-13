# frozen_string_literal: false

require_relative 'matrix'

# The Matrix class is responsible for the tictactoe game functioning
class Game < Matrix
  def initialize
    super
    @players = %w[x o]
    @current_turn = 0
  end

  def ask_position
    x, y = 0
    loop do
      print 'Escriba el numero de columna: '
      x = gets.chomp.to_i - 1
      print 'Escriba el numero de fila: '
      y = gets.chomp.to_i - 1
      break unless @matrix[y][x] != ' '

      print "Esa celda está ocupada, escoja otra. \n"
    end
    [x, y]
  end

  def input
    x, y = ask_position

    write(x, y, @players[@current_turn])
  end

  def winner?
    3.times do |i|
      return true if check_vector(column(i)) || check_vector(row(i)) || check_vector(diag[0]) || check_vector(diag[1])
    end
    false
  end

  def check_vector(vec)
    !vec.include?(' ') && vec.uniq.size == 1
  end

  def space_left?
    @matrix[0].include?(' ') || @matrix[1].include?(' ') || @matrix[2].include?(' ')
  end

  def start
    loop do
      # winner?
      print "Turno de #{@players[@current_turn]}\n"
      display
      input
      break if winner? || !space_left?

      @current_turn = @current_turn.zero? ? 1 : 0
      system('clear')

      break unless space_left?
    end
  end

  def play
    system('clear')
    start
    system('clear')
    display
    print space_left? ? "El ganador es #{@players[@current_turn]} \n" : "Es una empate\n"
  end
end
