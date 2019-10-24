class Journey
  attr_reader :entry, :exit

  def initialize(entry = nil)
    @entry = entry
    @exit = nil
  end

  def finish(exit = nil)
    @exit = exit
  end

  def complete?
    !@exit.nil?
  end

  def fare
    @entry.nil? || @exit.nil? ? 6 : 1
  end
end
