class Board
    attr_accessor :board
    
    def initialize
        @board = Array.new(3) { Array.new(3, " ") }
    end
    
    def display_board
        puts "  0 1 2"
        @board.each_with_index do |row, index|
            print "#{index} "
            row.each do |cell|
                print "#{cell}|"
            end
            puts "\n  -----"
        end
    end
    
    def update_board(row, column, symbol)
        @board[row][column] = symbol
    end
    
    def check_winner(symbol)
        # Check rows
        @board.each do |row|
            return true if row.all? { |cell| cell == symbol }
        end
        # Check columns
        @board.transpose.each do |column|
            return true if column.all? { |cell| cell == symbol }
        end
        # Check diagonals
        return true if (0..2).all? { |i| @board[i][i] == symbol }
        return true if (0..2).all? { |i| @board[i][2 - i] == symbol }
        false
    end
    
    
    def full?
        @board.all? { |row| row.none? { |cell| cell == " " } }
    end
end

board = Board.new
board.display_board

board.update_board(0, 0, "X")

board.display_board