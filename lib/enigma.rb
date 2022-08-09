#this is a class that encrypts and decrypts messages

require 'date'
require './lib/enigma_module'
class Enigma
  attr_reader :character_array, :date, :rand_key

  include Enigmable

  def initialize
    @character_array = ('a'..'z').to_a << ' '
    @date = Date.today.strftime('%d%m%y')
    @rand_key = (Array.new(5) { rand(0..9) }).join
  end

  def encrypt(message, key = @rand_key, date = @date)
    if message.empty? != true
      encrypt_generator(message, key, date)
    else
      p 'Please enter a message'
    end
  end

  def encrypt_generator(message, key = @rand_key, date = @date)
    message = message.downcase.chars
    shifts = shift_generator(key, date)
    encrypted_message = message.map.with_index do |character, index|
      if @character_array.include?(character) == false
        character
      else
        @character_array[(@character_array.index(character) + shifts[index % 4]) % character_array.length]
      end
    end.join
    { encryption: encrypted_message, key: key, date: date }
  end

  def decrypt(message, key = @rand_key, date = @date)
    message = message.downcase.chars
    shifts = shift_generator(key, date)
    decrypted_message = message.map.with_index do |character, index|
      if @character_array.include?(character) == false
        character
      else
        @character_array[(@character_array.index(character) - shifts[index % 4] % character_array.length)]
      end
    end.join
    { decryption: decrypted_message, key: key, date: date }
  end
end
