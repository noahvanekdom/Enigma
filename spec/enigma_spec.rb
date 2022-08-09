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


        ##BIG GOAL TEST HERE -- ONCE WE HAVE THIS WE ARE LIKE HALFWAY THERE REMEMBER
        ## JUST KEEP SWIMMING NOAH ITS GONNA BE OKAY
        xit 'can encrypt a string' do
            expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"

            }
            expected1 = {
                encryption: "keder ohulw!",
                key: "02715",
                date: "040895"

            }

            expect(enigma.encrypt("hello world", "02715", "040895")).to eq expected
            expect(enigma.encrypt("hello world", "02715", "040895")).to eq expected
        end
    end


    ##Do we need these keys/offsets to be individual methods? maybe faster way to do it?
    describe 'creating keys' do

        xit 'can generate a random key' do
            expect(enigma.keygen).to eq ""
            expect(enigma.keygen.length).to eq 5
        end
    end

    describe 'creating offsets' do

        xit 'can generate an offset from the date' do
            expect(enigma.offset).to eq ''
        end

    end

    describe 'creating final shift' do

        xit 'can generate a final shift based on the array values for offset and key' do
            expect(enigma.final_shift).to eq ''
        end
    end




        #make key array, make offset array, call positions in that array when rotating character array


    #     xit 'can create the a key' do
    #         expect(enigma.a_key('02715')).to eq '02'
    #     end

    #     xit 'can create the B key' do
    #         expect(enigma.b_key('02715')).to eq '27'
    #     end

    #     xit 'can create the C key' do
    #         expect(enigma.c_key('02715')).to eq '71'
    #     end

    #     xit 'can create the D key' do
    #         expect(enigma.d_key('02715')).to eq '15'
    #     end
    # end

    # describe 'creating offsets' do
    #     xit 'can create the A offset' do
    #     end
    #     xit 'can create the A offset' do
    #     end
    #     xit 'can create the A offset' do
    #     end
    #     xit 'can create the A offset' do
    #     end
    # end

    # describe 'creating shift' do
    #     xit 'can create the A shift' do
    #     end

    #     xit 'can create the B shift' do
    #     end

    #     xit 'can create the C shift' do
    #     end

    #     it 'can create the D shift' do
    #     end

end