class ComputerPlayer

    attr_reader :mark
    
    def initialize(mark)

        @mark = mark

    end

    def get_position(legal_positions)

        position = legal_positions.sample
        puts "Player #{@mark}, chose position #{position.join(" ")}"
        position

    end

end