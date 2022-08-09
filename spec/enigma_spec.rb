require_relative 'spec_helper'

describe Enigma do
    let(:enigma) { Enigma.new }
    describe 'initialize' do
        xit 'exists' do
            expect(enigma).to be_instance_of Enigma
        end

        describe 'date_string creation' do
            has
            it

        xit 'can encrypt a string' do
            expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"

            }

            expect(enigma.encrypt("hello world", "02715", "040895")).to eq expected
        end
    end

    describe 'creating keys' do
        xit 'can create the a key' do
            expect(enigma.a_key('02715')).to eq '02'
        end

        xit 'can create the B key' do
            expect(enigma.b_key('02715')).to eq '27'
        end

        xit 'can create the C key' do
            expect(enigma.c_key('02715')).to eq '71'
        end

        xit 'can create the D key' do
            expect(enigma.d_key('02715')).to eq '15'
        end
    end

    describe 'creating offsets' do
        xit 'can create the A offset' do
        end
        xit 'can create the A offset' do
        end
        xit 'can create the A offset' do
        end
        xit 'can create the A offset' do
        end
    end

    describe 'creating shift' do
        xit 'can create the A shift' do
        end

        xit 'can create the B shift' do
        end

        xit 'can create the C shift' do
        end

        it 'can create the D shift' do
        end
    end


end