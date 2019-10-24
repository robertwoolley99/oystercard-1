require "oystercard"

describe Oystercard do
  subject(:card) { Oystercard.new }
  let(:entry) { double :station }
  let(:exit) { double :station }

  context 'with balance, touch in and touch out' do
    before do
      card.top_up(50)
      card.touch_in(entry)
      card.touch_out(exit)
    end

    it 'balance is reduced by minimum fare' do
      card.touch_in("St James Park")
      expect { card.touch_out(exit) }.to change{ card.balance }.by -Oystercard::MIN_FARE
    end

    it 'journey history contains one hash with entry and exit' do
      expect(card.journey_history).to eq([{ entry: entry, exit: exit }])
    end
  end

  context 'without balance' do

    it 'check minimum balance on touch in' do
      expect { card.touch_in(entry) }.to raise_error("Balance too low to touch in. Minimum fare is £#{Oystercard::MIN_FARE}")
    end
  end

  describe '#top_up' do

    it 'can top up the balance' do
      expect{  card.top_up 10 }.to change{ card.balance }.by 10
    end

    it 'throws error when trying to top up past limit' do
      expect { card.top_up 100 }.to raise_error(RuntimeError, "top up limit #{Oystercard::LIMIT} reached")
    end
  end
end
