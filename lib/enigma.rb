require 'date'
class Enigma
    attr_reader :character_array, :date, :rand_key

    def initialize
        @character_array = ("a".."z").to_a << " "
        @date = Date.today.strftime('%d%m%y')
        @rand_key = (Array.new(5) { rand(0..9) }).join
    end

        #seems like we dont need this

    # def offset_generator(date)
    #    ((date.to_i) ** 2).to_s[-4..-1]
    # end

    def shift_generator(key, date)
        a_shift = (key[0..1].to_i + (date.to_i ** 2).to_s[-4..-1][0].to_i)
        b_shift = (key[1..2].to_i + (date.to_i ** 2).to_s[-4..-1][1].to_i)
        c_shift = (key[2..3].to_i + (date.to_i ** 2).to_s[-4..-1][2].to_i)
        d_shift = (key[3..4].to_i + (date.to_i ** 2).to_s[-4..-1][3].to_i)
        shifts_array = [a_shift, b_shift, c_shift, d_shift]
    end

    def encrypt(message, key = @rand_key, date = @date)
        message = message.downcase.chars
        shifts = shift_generator(key, date)
        encryption = message.map.with_index do |character, index|
            if @character_array.include?(character) == false
                character
            else
                @character_array[(@character_array.index(character) + shifts[index % 4]) % 27]
            end
        end.join
        {encryption: encryption, key: key, date: date}
    end

    def decrypt(message, key = @rand_key, date = @date)
        message = message.downcase.chars
        shifts = shift_generator(key, date)
        decryption = message.map.with_index do |character, index|
            if @character_array.include?(character) == false
                character
            else
                @character_array[(@character_array.index(character) - shifts[index % 4] % 27)]
            end
        end.join
        {decryption: decryption, key: key, date: date}
    end
end
