class Oystercard
  attr_reader :balance, :in_journey

  LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "top up limit #{LIMIT} reached" if @balance + value > LIMIT

    @balance += value
  end

  def deduct(value)

    @balance -= value
  end

  def touch_in
    @in_journey = true
  end
end
