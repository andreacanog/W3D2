require_relative 'board.rb'

class Card 

    attr_reader :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def face_up?
        @face_up == false
    end

    def ==(other_card)
        @face_value == other_card.face_value
    end

    def hide
        @face_up = false
    end

    def reveal 
        @face_up = true
    end

    def to_s
        if self.face_up?
            return @face_value
        else
            return " "
        end
    end




















end