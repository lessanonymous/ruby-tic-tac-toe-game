class HumanPlayer

    attr_reader :mark
    
    def initialize(mark)

        @mark = mark

    end

    def valid_input?(position)

        valid_chars = "1234567890"
        return false if position.length != 3 || position.split(" ").length != 2
        position.split(" ").all? { | coordinate | valid_chars.include?(coordinate) }

    end

    def get_position(legal_positions)

        puts "Player #{@mark}, enter a position in the following format '1 2'"
        input = gets.chomp
        position = input.split(" ").map!(&:to_i)

        if !valid_input?(input)

            puts "Your input was invalid"
            return get_position(legal_positions)

        elsif !legal_positions.include?(position)

            puts "Please enter an empty position"
            return get_position(legal_positions) 

        end

        position

    end

end