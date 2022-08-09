require 'date'
class Enigma
    attr_reader :character_array, :date

    def initialize
        @character_array = ("a".."z").to_a << " "
        @date = Date.today.strftime('%d%m%y')
        @rand_key = (Array.new(5) { rand(0..9) }).join
    end

    def a_key(key)
        @rand_key[0..1].to_i
    end

    def b_key(key)
        @rand_key[1..2].to_i
    end

    def c_key(key)
        @rand_key[2..3].to_i
    end

    def d_key(key)
        @rand_key[3..4].to_i
    end
end
