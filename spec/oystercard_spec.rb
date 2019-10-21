require "oystercard"

describe Oystercard do
  subject(:card) { Oystercard.new }

  it 'initialise oystercard with balance of 0' do
    expect(card.balance).to eq 0
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
