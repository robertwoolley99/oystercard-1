require "oystercard"

describe Oystercard do
  subject(:card) { Oystercard.new }

  context 'new card' do
    it 'initialise oystercard with balance of 0' do
      expect(card.balance).to eq 0
    end

    it 'in_journey? is false' do

      expect(card.in_journey).to be false
    end
  end

  context 'with balance' do
    before do 
      card.top_up(50)
      card.touch_in
    end

    it 'touch in card' do
      expect(card.in_journey).to be true
    end

    it 'touch out card' do
      card.touch_out
      expect(card.in_journey).to be false
    end

    it 'touch out card reduces balance by minimum fare' do
      expect { card.touch_out }.to change{ card.balance }.by -1
    end
  end

  context 'without balance' do

    it 'check minimum balance on touch in' do
      expect { card.touch_in }.to raise_error("Balance too low to touch in. Minimum balance is £#{Oystercard::MINIMUM_BALANCE}")
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
