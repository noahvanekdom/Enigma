require_relative 'spec_helper'
require './lib/enigma'

describe Enigma do
  let(:enigma) { Enigma.new }
  describe 'initialize' do
    it 'exists' do
      expect(enigma).to be_instance_of Enigma
    end

    it 'can return the date in mmddyy string format' do
      expect(enigma.date).to be_a(String)
      expect(enigma.date.length).to eq 6
    end

    it 'has a character set that includes all lowercase letters and " "' do
      expect(enigma.character_array).to eq ['a', 'b', 'c', 'd', 'e', 'f',
                                            'g', 'h', 'i', 'j', 'k', 'l',
                                            'm', 'n', 'o', 'p', 'q', 'r',
                                            's', 't', 'u', 'v', 'w', 'x',
                                            'y', 'z', ' ']
    end
  end

  describe 'encrypt' do
    it 'can encrypt a string' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expected1 = {
        encryption: 'keder ohulw!?',
        key: '02715',
        date: '040895'
      }

      expect(enigma.encrypt('hello world', '02715', '040895')).to eq expected
      expect(enigma.encrypt('hello world!?', '02715', '040895')).to eq expected1
    end

    xit 'can encrypt using default values for date and key' do
      expect(enigma.encrypt('hello world')).to eq ''
    end

    context 'when no message is entered' do
      it 'returns "please enter a message" ' do
        expect(enigma.encrypt('')).to eq 'Please enter a message'
      end
    end
  end

  describe 'decrypt' do
    it 'can decrypt a string' do
      expected = {
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      }
      expected1 = {
        decryption: 'hello world!?',
        key: '02715',
        date: '040895'
      }

      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq expected
      expect(enigma.decrypt('keder ohulw!?', '02715', '040895')).to eq expected1
    end
  end

  describe 'creating keys' do
    it 'can generate a random key' do
      # allow statement here
      # expect(enigma.rand_key).to eq "22233"
      expect(enigma.rand_key.length).to eq 5
      expect(enigma.rand_key).to be_a(String)
    end
  end

  describe 'creating final shift' do
    it 'can generate a final shift based on the array values for offset and key' do
      expect(enigma.shift_generator('02715', '123456')).to be_a(Array)
      expect(enigma.shift_generator('02715', '123456')[0]).to eq(5)
      expect(enigma.shift_generator('02715', '123456')[1]).to eq(36)
    end
  end
end
