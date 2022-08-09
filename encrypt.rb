#encrypt runner
require_relative './lib/enigma'

enigma = Enigma.new

original_message = File.open(ARGV[0]).read

encrypted_hash = enigma.encrypt(original_message)

decryption = decryption_hash[:decryption]


# encryption = enigma.encrypt[:encryption]
# key = enigma.encrypt[:key]
# date = enigma.encrypt[:date]
