require "oystercard"

describe Oystercard do
  subject(:card) { Oystercard.new }

context 'new card' do
    it 'initialise oystercard with balance of 0' do
      expect(card.balance).to eq 0
    end

    it 'in_journey? is false' do
      expect { is_expected.to_not be_in_journey }
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

  describe '#deduct' do
    it 'can deduct from balance' do
      expect { card.deduct 10 }.to change{ card.balance }.by -10
    end
  end


end
