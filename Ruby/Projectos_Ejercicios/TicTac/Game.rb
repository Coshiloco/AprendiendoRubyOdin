
require_relative 'Board'
require_relative 'Player'

class Game
    
    attr_accessor :board, :current_player, :players
    
    
    def initialize
        @board = Board.new
        @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
        @current_player = @players[0]
    end
    
    
    def play
        gamne_over = false
        loop do
            @board.display_board
            row, column = get_move
            @board.update_board(row, column, @current_player.symbol)
            if @board.check_winner(@current_player.symbol)
                puts "Congratulations, you won!"
                game_over = true
            elsif @board.full?
                puts "It's a tie!"
                game_over = true
            end
            break if game_over
            switch_players
        end
    end
    
    def switch_players
        @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end
    
    def game_over?
        @board.check_winner(@current_player.symbol) || @board.full?
    end
    
end


new_game = Game.new


new_game.play