require_relative "card.rb"
require "byebug"
class Board 

    def self.render(board)
        board.each do |row|
            row.each do |card|
                puts card.to_s
            end
        end
    end


    def initialize(size)
        if size > 26
            raise 'Choose a number between 1 and 26'
        end
        @board = Array.new(size) { Array.new(size) }
    end

    def full?
        @board.all? do |array| 
            array.all? { |ele| ele != nil }
        end
    end

    def random(letter)
        rand_row1 = rand(0...@board.length)
        rand_col1 = rand(0...@board.length)

        rand_row2 = rand(0...@board.length)
        rand_col2 = rand(0...@board.length)

        position1 = rand_row1, rand_col1
        position2 = rand_row2, rand_col2
        
        if self[position1] == nil && self[position2] == nil && position1 != position2
            self[position1] = Card.new(letter) 
            self[position2] = Card.new(letter)
        end
    end

    def [](position)
        row, col = position
        @board[row][col]
    end

    def []=(position, value)
        
        row, col = position
        @board[row][col] = value
    end

    def populate
        alphabet = ("a".."z").to_a
        until self.full?
            
            letter = alphabet.sample
            if @board.flatten.none? { |card| card != nil ? card.face_value == letter : false }
                self.random(letter)
            end
        end
        self
    end

    def hide
        @board.map do |row|
            row.map { |ele| " " }
        end
    end

    # def cheat
    #     Board.render(@board)
    # end

    # def print
    #     Board.render(self.hide)
    # end



end