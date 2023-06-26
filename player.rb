class Player
    attr_reader :score
    attr_writer :score
    attr_reader :win
    attr_writer :win

    def initialize()
        @score = 3
        @win = true
    end

    def loss_score()
        @score-=1
    end
end