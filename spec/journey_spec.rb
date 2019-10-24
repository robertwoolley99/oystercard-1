require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  let(:card) { double :Oystercard }
  let(:entry) { double :Station }
  let(:exit) { double :Station }

  context 'after touching in, i.e. on initialization' do
    it 'has no entry station by default' do
      expect(journey.entry).to be nil
    end

    it 'has an entry station if passed in' do
      new_journey = Journey.new('Victoria')
      expect(new_journey.entry).to eq 'Victoria'
    end

    it 'has no exit station set' do
      expect(journey.exit).to be nil
    end

    it 'is not complete' do
      expect(journey.complete?).to eq false
    end
  end

  # context 'after touching in and touching out' do
    # it 'has an entry station' do
    # end

    # it 'has an exit station' do
    # end

    # it 'is complete' do
    # end
  # end
end

# FROM OYSTERCARD SPEC
  # context 'with balance and touch in' do
    # before do
      # card.top_up(50)
      # card.touch_in(entry)
    # end

    # it 'is "in journey"' do
      # expect(card).to be_in_journey
    # end
  # end

  # context 'with balance, touch in and touch out' do
    # before do
      # card.top_up(50)
      # card.touch_in(entry)
      # card.touch_out(exit)
    # end
    # it 'is not "in journey"' do
      # expect(card).not_to be_in_journey
    # end
  # end

# end
