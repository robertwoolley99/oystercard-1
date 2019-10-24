# frozen_string_literal: true

require 'journey_log'

describe JourneyLog do
  subject(:log) { JourneyLog.new }
  context 'Setup new object' do
    it 'creates an array to write journeys to' do
      expect(log.journey_history).to be_an(Array)
    end
  end
  context 'Test the current journey' do
    it 'Start a new journey' do
      log.journey_start('Kings Cross')
      expect(log.current_journey.entry).to eq('Kings Cross')
    end
  end
end
