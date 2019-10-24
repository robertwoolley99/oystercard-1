require 'journey'

class Oystercard
  attr_reader :balance, :journey_history

  LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(value)
    raise "top up limit #{LIMIT} reached" if @balance + value > LIMIT

    @balance += value
  end

  def touch_in(entry)
    raise "Balance too low to touch in. Minimum fare is £#{MIN_FARE}" if @balance < MIN_FARE

    @current_journey = Journey.new(entry)
  end

  def touch_out(exit)
    fare = @current_journey.finish(exit)
    deduct(fare)
    @journey_history << {entry: @current_journey.entry, exit: @current_journey.exit}
  end

  def in_journey?
    !@current_journey.complete?
  end

  private

  def deduct(value)
    @balance -= value
  end

end
