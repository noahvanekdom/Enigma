#encrypt runner
require_relative './lib/enigma'

enigma = Enigma.new

read_file = File.open(ARGV[0], 'r')
