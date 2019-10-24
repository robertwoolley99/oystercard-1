require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  let(:card) { double :Oystercard }
  let(:entry) { double :Station }
  let(:exit) { double :Station }

  context 'on initialization i.e. after touch in' do
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

  context 'after touching out with a station' do
    before do
      journey.finish('Waterloo')
    end

    it 'has an exit station' do
      expect(journey.exit).to eq 'Waterloo'
    end

    it 'is complete' do
      expect(journey.complete?).to eq true
    end
  end

  context 'calculates fare' do
    before do
      journey_with_entry = Journey.new('Victoria')

      it 'returns minimum fare on finish' do
        journey_with_entry.finish('Waterloo')
        expect(journey_with_entry.fare).to eq Journey::MIN_FARE
      end

      it 'returns penalty fare if no entry station given' do
        journey.finish('Waterloo')
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end

      it 'returns penalty fare if no exit station given' do
        expect(journey_with_entry.fare).to eq Journey::PENALTY_FARE
      end
    end
  end
end
