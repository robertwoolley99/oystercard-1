require "oystercard"

describe Oystercard do
  
  it 'initialise oystercard with balance of 0' do
    test_card = Oystercard.new
    expect(test_card.balance).to eq 0
  end
end
