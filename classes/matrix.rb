# frozen_string_literal: false

# The Matrix class is responsible for the tictactoe game board
class Matrix
  def initialize
    @matrix = Array.new(3) { Array.new(3) { ' ' } }
  end

  def display
    @matrix.reverse.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        print cell
        # ascii 179
        print '│' unless j == 2
      end
      print "\n"
      # ascii 196 && 197
      print "─┼─┼─\n" unless i == 2
    end
  end

  def row(index)
    @matrix[index]
  end

  def column(index)
    col = []
    3.times { |i| col.push(row(i)[index]) }
    col
  end

  def diag
    diag = [[], []]
    3.times do |i|
      diag[0].push(row(i)[i])
      diag[1].push(row(i)[row(i).length - 1 - i])
    end
    diag
  end

  def empty?(x_pos, y_pos)
    @matrix[y_pos][x_pos] == ' '
  end

  def write(x_pos, y_pos, char)
    @matrix[y_pos][x_pos] = char if @matrix[y_pos][x_pos] == ' '
  end
end
