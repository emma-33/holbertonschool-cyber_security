#!/usr/bin/env ruby
class CaesarCipher
    @@UP_LET = ("A".."Z").to_a
    @@LOW_LET = ("a".."z").to_a

    def initialize(shift)
        @shift = shift
    end

    def encrypt(message)
        cypher(message, @shift)
    end

    def decrypt(message)
        cypher(message, -@shift)
    end

    private
    def cypher(message, shift)
        new_message = ""
        message.split("").to_a.each { |letter|
            if @@UP_LET.include? letter
                new_message += @@UP_LET[(@@UP_LET.index(letter) + shift) % 26]
            elsif @@LOW_LET.include? letter
                new_message += @@LOW_LET[(@@LOW_LET.index(letter) + shift) % 26]
            else
                new_message += letter
            end
        }
        return new_message
    end
end
