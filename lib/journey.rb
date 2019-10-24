class Journey
  attr_reader :entry, :exit

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry = nil)
    @entry = entry
    @exit = nil
  end

  def finish(exit)
    @exit = exit
  end

  def complete?
    !@exit.nil?
  end

  def fare
    @entry.nil? || @exit.nil? ? PENALTY_FARE : MIN_FARE
  end
end
