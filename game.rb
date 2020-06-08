require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    
    def initialize(size, players)

        @players = players.map { | mark, ai | ai ? ComputerPlayer.new(mark) : HumanPlayer.new(mark) }
        @board = Board.new(size) 
        @current_player = @players[0]

    end

    def switch_turn
        
        @current_player = @players.rotate![0]

    end

    def play 

        while @board.empty_positions?

            @board.print
            position = @current_player.get_position(@board.legal_positions)
            mark = @current_player.mark
            @board.place_mark(position, mark)
            if @board.win?(mark) 

                return puts "Player #{mark}, YOU WON!"

            else
                
                self.switch_turn

            end

        end

        puts "This game was a draw"

    end

end