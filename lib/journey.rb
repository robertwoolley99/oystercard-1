class Journey
  attr_reader :entry, :exit

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry = nil)
    @entry = entry
    @exit = nil
  end

  def finish(exit = nil)
    @exit = exit
    fare
  end

  def complete?
    !@exit.nil?
  end

  private

  def fare
    @entry.nil? || @exit.nil? ? PENALTY_FARE : MIN_FARE
  end
end
