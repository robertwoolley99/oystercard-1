class Oystercard
  attr_reader :balance, :journey_history

  LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @current_journey = {}
  end

  def top_up(value)
    raise "top up limit #{LIMIT} reached" if @balance + value > LIMIT

    @balance += value
  end

  def touch_in(entry)
    raise "Balance too low to touch in. Minimum fare is £#{MIN_FARE}" if @balance < MIN_FARE

    @current_journey[:entry] = entry
  end

  def touch_out(exit)
    deduct(1)
    @current_journey[:exit] = exit
    @journey_history << @current_journey
    @current_journey = {}
  end

  def in_journey?
    @current_journey.key?(:entry) && !@current_journey.key?(:exit)
  end

  private

  def deduct(value)
    @balance -= value
  end

end
