require 'station'

describe Station do
  subject(:station) { Station.new(name: "Waterloo", zone: 1) }
  context 'new station' do
    it 'name is Waterloo' do
      expect(station.name).to eq "Waterloo"
    end

    it 'zone is 1' do
      expect(station.zone).to eq 1
    end
  end
end
