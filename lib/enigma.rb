require 'date'
require './lib/enigma_module'
class Enigma
    attr_reader :character_array, :date, :rand_key
    include Enigmable

    def initialize
        @character_array = ("a".."z").to_a << " "
        @date = Date.today.strftime('%d%m%y')
        @rand_key = (Array.new(5) { rand(0..9) }).join
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
