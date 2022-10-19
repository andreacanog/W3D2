require_relative "card.rb"
require_relative "board.rb"

class Game
    # attr_accessor :previous_guess

    def initialize(size)
        @board = Board.new(size)
        # @previous_guess = previous_guess
    end

    def get_input
        puts 'Please enter two numbers separated by a space, like `0 2`'
        pos = gets.chomp
        new_pos = pos.split(' ').map{ |num| num.to_i }
        # new_pos.each do |num|
        #     if num < 0 || num > @board[0].length
        #         raise 'Invilad input'
        #     end
        # end

    end


    def play
        @board.populate
        @board.print
        position = self.get_input
            puts @board[position] 


    end





end