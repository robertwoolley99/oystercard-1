class JourneyLog
  attr_reader :journey_history, :current_journey

  def initialize
    @journey_history = []
  end

  def journey_start(entry_station)
    @current_journey = Journey.new(entry_station)

  end
end
