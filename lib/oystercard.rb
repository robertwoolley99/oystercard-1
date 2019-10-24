require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey_history

  LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @in_journey = false
  end

  def top_up(value)
    raise "top up limit #{LIMIT} reached" if @balance + value > LIMIT

    @balance += value
  end

  def touch_in(entry)
    raise "Balance too low to touch in. Minimum fare is £#{MIN_FARE}" if @balance < MIN_FARE

    if @in_journey
      deduct(@current_journey.fare)
      update_history
      @in_journey = false
      @current_journey = nil
    end
    @current_journey = Journey.new(entry)
    @in_journey = true
  end

  def touch_out(exit)
    if @current_journey.nil?
      @current_journey = Journey.new
    end
    @current_journey.finish(exit)
    deduct(@current_journey.fare)
    update_history
    @in_journey = false
    @current_journey = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def update_history
    @journey_history << {entry: @current_journey.entry, exit: @current_journey.exit}
  end
end
