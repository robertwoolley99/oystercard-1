class Journey
  attr_reader :entry, :exit

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
end
