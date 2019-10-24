class Journey
  attr_reader :entry, :exit

  def initialize(entry = nil)
    @entry = entry
    @exit = nil
  end

  def complete?
    !@entry.nil? && !@exit.nil?
  end
end
