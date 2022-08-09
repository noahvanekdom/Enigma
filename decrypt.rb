# decrypt runner
require_relative './lib/enigma'

enigma = Enigma.new

encrypted_message = File.open(ARGV[0]).read

decrypted_hash = enigma.decrypt(encrypted_message, ARGV[2], ARGV[3])

decrypted_message = File.open(ARGV[1], 'w')

decrypted_message.write(decrypted_hash[:decryption])

p "Created '#{ARGV[1]}' with the key #{decrypted_hash[:key]} and date #{decrypted_hash[:date]}"
