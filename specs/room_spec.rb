require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../refreshments')

class TestRoom < MiniTest::Test

  def setup
    @blue_room = Room.new("Blue Room", 14, 30.00,
      [Guest.new("Larry", 75.00, 32), Guest.new("Curly", 39.00, 17), Guest.new("Moe", 5.45, 49)],
      [Song.new("Louis Louis", "The Kingsmen", 0004), Song.new("Tutti Fruiti", "Little Richard", 0005)],
      [Refreshments.new("Coke", 1.80, 0), Refreshments.new("Crisps", 0.75, 0), Refreshments.new("Lager", 3.00, 18)])
  end

  def test_room_has_name
    assert_equal(@blue_room.room_name, "Blue Room")
  end

  def test_room_has_capacity
    assert_equal(@blue_room.capacity, 14)
  end

  def test_room_has_hire_price
    assert_equal(@blue_room.hire_price, 30)
  end

  def test_room_has_song_list
    assert_equal("Louis Louis", @blue_room.song_list[0].title)
    assert_equal("Little Richard", @blue_room.song_list[1].artist)
  end

  def test_guest_can_be_added_to_room
    @blue_room.add_guest("Groucho", 200, 49)
    assert_equal([@blue_room.guest_list[3].guest_name, @blue_room.guest_list[3].guest_money, @blue_room.guest_list[3].guest_age], ["Groucho", 200, 49])
  end

  def test_song_can_be_added_to_room
    @blue_room.add_song_to_room("Yesterday Once More", "The Carpenters", 0006)
    assert_equal([@blue_room.song_list[2].title, @blue_room.song_list[2].artist, @blue_room.song_list[2].number], ["Yesterday Once More", "The Carpenters", 0006])
  end

  def test_refreshments_can_be_added_to_room
    @blue_room.add_refreshments_to_room("Peanuts", 0.90, 0)
    assert_equal([@blue_room.refreshments_list[3].refreshments_name, @blue_room.refreshments_list[3].refreshments_cost, @blue_room.refreshments_list[3].age_limit], ["Peanuts", 0.90, 0])
  end

  def test_age_limited_guests
    age_limited_guests = @blue_room.list_age_limited_guests(18)
    assert_equal(["Curly"], age_limited_guests)
  end

  def test_list_guests_names
    assert_equal(["Larry", "Curly", "Moe"], @blue_room.list_guests_names)
  end

  def test_list_songs_in_room
    assert_equal(["Louis Louis", "Tutti Fruiti"], @blue_room.list_songs_in_room)
  end

  def test_list_refreshments_ordered
    assert_equal(["Coke", "Crisps", "Lager"], @blue_room.list_refreshments_ordered)
  end

  def test_remove_guest
    @blue_room.remove_guest("Moe")
    assert_equal(2, @blue_room.guest_list.count)
  end

  def test_remove_song
    @blue_room.remove_song(0004)
    assert_equal(["Tutti Fruiti"], @blue_room.list_songs_in_room)
  end

  def test_cancel_refreshments
    @blue_room.cancel_refreshments("Coke")
    assert_equal(["Crisps", "Lager"], @blue_room.list_refreshments_ordered)
  end

  def test_total_refreshments_bill
    assert_equal(5.55, @blue_room.total_refreshments_bill)
  end

  def test_total_bill_for_booking
    assert_equal(35.55, @blue_room.total_bill_for_booking)
  end

  def test_guests_total_money
    assert_equal(119.45, @blue_room.guests_total_money)
  end

  def test_capacity_not_exceeded
    assert_equal(true, @blue_room.capacity_not_exceeded)
  end

  def test_guests_can_pay_for_booking
    assert_equal(true, @blue_room.guests_can_pay_for_booking)
  end

end