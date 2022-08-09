require_relative 'spec_helper'
require './lib/enigma'

describe Enigma do
  let(:enigma) { Enigma.new }
  let(:expected) { {
    encryption: 'keder ohulw',
    key: '02715',
    date: '040895'
  } }
  let(:expected1) { {
    encryption: 'keder ohulw!?',
    key: '02715',
    date: '040895'
  } }
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
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq expected
      expect(enigma.encrypt('hello world!?', '02715', '040895')).to eq expected1
    end

    it 'can encrypt using default values for date and key' do
      shift = [1, 2, 3, 4]
      key = '123456'
      allow(enigma).to receive(:shift_generator).and_return(shift)
      allow(enigma).to receive(:rand_key).and_return(key)
      allow_any_instance_of(Date).to receive(:strftime).and_return("040895")
      expect(enigma.encrypt('hello world')).to eq ''
    end

    context 'when no message is entered' do
      it 'returns "please enter a message" ' do
        expect(enigma.encrypt('')).to eq 'Please enter a message'
      end
    end


  end

  describe 'decrypt' do
    let(:expected) { {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    } }
    let(:expected1) { {
      decryption: 'hello world!?',
      key: '02715',
      date: '040895'
    } }
    it 'can decrypt a string' do

      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq expected
      expect(enigma.decrypt('keder ohulw!?', '02715', '040895')).to eq expected1
    end

    it 'can decrypt a string using default values for date' do
    end

  end

  describe 'creating keys' do
    it 'can generate a random key' do
      key = "22233"
      allow(enigma).to receive(:rand_key).and_return(key)
      expect(enigma.rand_key).to eq "22233"
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
