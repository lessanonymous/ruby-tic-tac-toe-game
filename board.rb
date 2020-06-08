class Board 
    
    def initialize(n)

        @grid = Array.new(n) { Array.new(n, "_")  }

    end

    def valid?(position)

        row = position[0]
        col = position[1]
        return false if !@grid[row]
        @grid[row][col] ? true : false

    end

    def empty?(position)

        row = position[0]
        col = position[1]
        @grid[row][col] == "_"

    end

    def place_mark(position, mark)

        if !self.valid?(position)

            raise "Choose a valid position"

        elsif !self.empty?(position)

            raise "Choose an empty position on the board"

        else
        
            row = position[0]
            col = position[1]
            @grid[row][col] = mark

        end

    end

    def print

        @grid.each { | row | puts row.join(" ") }

    end

    def win_row?(mark)

        @grid.any? { | row | row.uniq.length == 1 && row[0] == mark }

    end

    def win_col?(mark)

        @grid.transpose.any? { | col | col.uniq.length == 1 && col[0] == mark }

    end

    def win_diagonal?(mark)

        (0...@grid.length - 1).all? do | idx |

         ( @grid[idx][idx] == @grid[idx + 1][idx + 1] && @grid[idx][idx] == mark ) || 
         ( @grid[idx].reverse[idx] == @grid[idx + 1].reverse[idx + 1] && @grid[idx].reverse[idx] == mark )

        end

    end

    def win?(mark)

        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)

    end

    def empty_positions?

        @grid.any? { | row | row.any? { | position | position == "_"  } }

    end

    def legal_positions

        positions = []

        @grid.each_with_index do | row, idx1 | 
            
            row.each_with_index { | position, idx2 | positions << [idx1, idx2] if position == "_" }
            
        end

        positions

    end

end