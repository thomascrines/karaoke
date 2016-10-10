require_relative 'room'
require_relative 'guest'
require_relative 'song'
require_relative 'refreshments'

class Karaoke

  attr_reader(:karaoke, :room)

  def initialize(karaoke, room)
    @karaoke = karaoke
    @room = room
  end

  def summarise_event
    return "You sang in the #{@room} at the #{@karaoke}.
    Your guests were #{@room.guest_list}.
    You had #{@room.list_refreshments_ordered}.
    The cost of your room is £#{@room.hire_price}.
    The cost of your refreshments is £#{@room.total_refreshments_bill}.
    Altogether you have £#{@room.guests_total_money}..."
    if @room.guests_can_pay_for_room == true
      puts "...so you can pay.
      Thanks for coming to #{@karaoke_name}"
    else
      puts "...but you don't have enough money.
      You can stay at the #{@karaoke} until you work it off."
    end
  end

end