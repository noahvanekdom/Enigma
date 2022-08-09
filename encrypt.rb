# encrypt runner
require_relative './lib/enigma'

enigma = Enigma.new

if ARGV != ['txt_files/message.txt', 'txt_files/encrypted.txt']
  puts 'Please enter correct filenames'
  return
end

original_message = File.open(ARGV[0]).read

encrypted_hash = enigma.encrypt(original_message)

File.open(ARGV[1], 'w').write(encrypted_hash[:encryption])

p "Created '#{ARGV[1]}' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
