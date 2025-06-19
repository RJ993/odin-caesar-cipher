require 'rspec'
require_relative '../lib/caesar-cipher'

describe CaesarWriting do
  describe '#write' do
    it 'translates lowercase letters' do
      phrase = described_class.new
      new_phrase = phrase.write('hello', 4)
      expect(new_phrase).to eql('lipps')
    end
    it 'translates uppercase AND lowercase letters' do
      phrase = described_class.new
      new_phrase = phrase.write('Hello', 4)
      expect(new_phrase).to eql('Lipps')
    end

    it 'doesn\'t change other characters' do
      phrase = described_class.new
      new_phrase = phrase.write('#Hello 2 suns!', 4)
      expect(new_phrase).to eql('#Lipps 2 wyrw!')
    end

    context 'when the shift key is not a valid input' do
      subject(:phrase) { described_class.new }
      before do
        input_one = -26
        input_two = 26
        input_three = 4
        allow(phrase).to receive(:shift_key_set_up).and_return(input_one, input_two, input_three)
      end
      it "doesn't except inputs larger than 25 or smaller than -25" do
        expect(phrase).to receive(:shift_key_set_up).exactly(3).times
        phrase.write('hello')
      end
    end
  end

  describe '#caesar_cipher' do
    context 'when letters are being shifted' do
      subject(:phrase) { described_class.new }
      before do
        allow(phrase).to receive(:lowercase_translator)
      end
      it 'translates 5 lowercase letters' do
        expect(phrase).to receive(:lowercase_translator).exactly(5).times
        phrase.caesar_cipher('hello', 4)
      end
    end
  end
end
