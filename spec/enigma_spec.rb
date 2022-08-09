require_relative 'spec_helper'

describe Enigma do
    let(:enigma) { Enigma.new }
    describe 'initialize' do
        it 'exists' do
            expect(enigma).to be_instance_of Enigma
        end

        it 'can encrypt a string' do
            expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"

            }

            expect(enigma.encrypt("hello world", "02715", "040895")).to eq expected
        end
    end

    describe 'creating keys' do
        it 'can create the a key' do
            expect(enigma.a_key('02715')).to eq '02'
        end

        it 'can create the B key' do
            expect(enigma.b_key('02715')).to eq '27'
        end

        it 'can create the C key' do
            expect(enigma.c_key('02715')).to eq '71'
        end

        it 'can create the D key' do
            expect(enigma.d_key('02715')).to eq '15'
        end
    end

    describe 'creating offsets' do
        it 'can create the A offset' do
        end
        it 'can create the A offset' do
        end
        it 'can create the A offset' do
        end
        it 'can create the A offset' do
        end
    end
end