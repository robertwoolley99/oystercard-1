require "oystercard"

describe Oystercard do
  subject(:card) { Oystercard.new }
  let(:origin) { double :station }

  context 'new card' do
    it 'initialise oystercard with balance of 0' do
      expect(card.balance).to eq 0
    end

    it 'in journey? is false' do

      expect(card).not_to be_in_journey
    end
  end

  context 'with balance and touch in' do
    before do
      card.top_up(50)
      card.touch_in(origin)
    end

    it 'sets journey status' do
      expect(card).to be_in_journey
    end

    it 'sets entry station' do
      expect(card.entry_station).to eq origin
    end

    it 'touch out card sets journey status' do
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it 'touch out sets entry_station to nil' do
      card.touch_out
      expect(card.entry_station).to eq nil
    end

    it 'touch out card reduces balance by minimum fare' do
      expect { card.touch_out }.to change{ card.balance }.by -1
    end

  end

  context 'without balance' do

    it 'check minimum balance on touch in' do
      expect { card.touch_in(origin) }.to raise_error("Balance too low to touch in. Minimum balance is £#{Oystercard::MINIMUM_BALANCE}")
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
