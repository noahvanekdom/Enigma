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

        xit 'can encrypt using default values for date and key' do
            #allow -- need to mock/stub for sure here
            expect(enigma.encrypt("hello world")).to eq "" #whatever is mocked
        end
    end

    describe 'creating keys' do

        it 'can generate a random key' do
            #allow statement here
            #expect(enigma.rand_key).to eq "22233"
            expect(enigma.rand_key.length).to eq 5
        end
    end

    describe 'creating offsets' do

        xit 'can generate an offset from the date' do
            expect(offset_generator("123456")).to eq []
        end

    end

    describe 'creating final shift' do

        it 'can generate a final shift based on the array values for offset and key' do
            expect(enigma.shift_generator("02715", "123456")).to be_a(Array)
            expect(enigma.shift_generator("02715", "123456")[0]).to eq(5)
            expect(enigma.shift_generator("02715", "123456")[1]).to eq(36)
        end
    end
end