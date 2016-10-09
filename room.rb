require_relative('guest')
require_relative('song')
require_relative('refreshments')
require('pry-byebug')

class Room

  attr_reader(:room_name, :capacity, :hire_price, :guest_list, :song_list, :refreshments_list)

  def initialize(room_name, capacity, hire_price, guest_list, song_list, refreshments_list)
    @room_name = room_name
    @capacity = capacity
    @song_list = song_list
    @hire_price = hire_price
    @refreshments_list = refreshments_list
    @guest_list = guest_list
  end

  def add_guest(guest_name, guest_money, guest_age)
    @guest_list << Guest.new(guest_name, guest_money, guest_age)
  end

  def add_song_to_room(title, artist, number)
    @song_list << Song.new(title, artist, number)
  end

  def add_refreshments_to_room(refreshments_name, refreshments_cost, age_limit) 
    @refreshments_list << Refreshments.new(refreshments_name, refreshments_cost, age_limit)
  end

  def list_guests_names
    return @guest_list.map {|guest| guest.guest_name}
  end

  def list_songs_in_room
   return @song_list.map {|song| song.title}
  end

  def list_refreshments_ordered
   return @refreshments_list.map {|refreshments| refreshments.refreshments_name}
  end

  def list_age_limited_guests(age_limit)
    age_limited_guests = @guest_list.select {|guest| guest.guest_age < age_limit}
    age_limited_guest_list = age_limited_guests.map {|guest| guest.guest_name}
    return age_limited_guest_list
  end

  def remove_guest(guest_name)
    guest_to_remove = @guest_list.find {|guest| guest.guest_name}
    @guest_list.delete(guest_to_remove)
  end

  def remove_song(song_number)
    song_to_remove = @song_list.find {|song| song.number}
    @song_list.delete(song_to_remove)
  end

  def cancel_refreshments(refreshments_name)
    refreshments_to_remove = @refreshments_list.find {|refreshments| refreshments.refreshments_name}
    @refreshments_list.delete(refreshments_to_remove)
  end

  def total_refreshments_bill
    sum = 0
    refreshments_prices = @refreshments_list.map {|refreshments| refreshments.refreshments_cost}
    refreshments_prices.each {|prices| sum += prices}
    return sum
  end

  def total_bill_for_booking
    return @hire_price + total_refreshments_bill
  end

  def guests_total_money
    sum = 0
    guests_money = @guest_list.map { |guest| guest.guest_money }
    guests_money.each {|money| sum += money}
    return sum
  end

  def capacity_not_exceeded
    if @guest_list.count <= @capacity
      return true
    else
      return false
    end
  end

  def guests_can_pay_for_booking
    if guests_total_money >= total_bill_for_booking
      return true
    else
      return false
    end
  end

end