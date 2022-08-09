require_relative 'spec_helper'
require './lib/enigma'

describe Enigma do
    let(:enigma) { Enigma.new }
    describe 'initialize' do
        it 'exists' do
            expect(enigma).to be_instance_of Enigma
        end

        describe 'date_array creation' do
            #date_array = []
           # how we do this?
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

        it 'can generate a random key' do
            expect(enigma.keygen).to eq ""
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


end