class Game
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @asker = 1
        @player = 2
        @user_answer = 0
        @answer = 0
    end

    def game_over
        puts "----- GAME OVER -----"
        puts "Good bye!"
    end

    def print_result
        puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
    end

    def ask_question
        puts "----- NEW TURN -----"
        num1 = random_number = rand(1..20);
        num2 = random_number = rand(1..20);
        @answer = num1 + num2;
        print "Palyer #{@asker}: What does #{num1} plus #{num2} equal?"
        @user_answer = gets.chomp.to_i
        check_answer();
    end

    def toggle_player
        if(@asker == 1)
            @asker = 2
            @player = 1
        else 
            @asker = 1
            @player = 2
        end
    end

    def check_answer
        if(@user_answer == @answer)
            puts "Palyer #{@asker}: YES! You are correct."
        else
            puts "Palyer #{@asker}: Seriously? No!"

            #distract the score from this player
            current_player = @player == 1 ? @player1 : @player2
            current_player.loss_score();
        end

        @user_answer = 0
        @answer = 0

        # to check if anyone got 0 score, need to call game_over() function
        if(@player1.score <= 0 || @player2.score <= 0)
            game_over()
        # else call print_result(); and toggle_player() function, then ask_question() function
        else
            print_result()
            toggle_player()
            ask_question()
        end
    end

end

