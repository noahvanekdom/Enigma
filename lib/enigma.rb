require 'date'
class Enigma
    def initialize
        @character_array = ("a".."z").to_a << " "
        @date = Date.today.strftime('%d%m%y')
    end

    def date_array_creation
        date_array = []
    end

    def keygen
    end

    def a_key(key)
        key[0..1].to_i
    end

    def b_key(key)
        key[1..2].to_i
    end

    def c_key(key)
        key[2..3].to_i
    end

    def d_key(key)
        key[3..4].to_i
    end
end
