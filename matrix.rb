# frozen_string_literal: false

class Matrix
  def initialize
    @matrix = Array.new(3) { Array.new(3) { ' ' } }
  end

  def display
    @matrix.each_with_index do |row, idx|
      row.each_with_index do |cell, idx|
        print cell
        # ascii 179
        print '│' unless idx == 2
      end
      print "\n"
      # ascii 196 && 197
      print '─┼─┼─' unless idx == 2
      print "\n"
    end
  end

  def get_row(n)
    @matrix[n]
  end

  def get_column(n)
    x = []
    3.times { |i| x.push(get_row(i)[n]) }
    x
  end

  def empty?(x, y)
    @matrix[y][x] == ' '
  end
end

m = Matrix.new
m.display
