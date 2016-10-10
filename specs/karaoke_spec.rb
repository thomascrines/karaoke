require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke')
require_relative('../room')
require_relative('../song')
require_relative('../refreshments')

class TestKaraoke < MiniTest::Test

  def setup
    @the_oo_ccc = Karaoke.new("The Object-Orientated CodeClan Caraoke", 
      [Room.new("Blue Room", 14, 30.00, [], [], []), 
      Room.new("Red Room", 4, 15.00, [], [], [])])

    # @default_song_list = [Song.new("Barbara Ann", "The Beach Boys", 0001), Song.new("Summertime Blues", "Eddie Cochran", 0002), Song.new("Be-Bop-A-Lula", "Gene Vincent", 0003), Song.new("Louis Louis", "The Kingsmen", 0004), Song.new("Tutti Fruiti", "Little Richard", 0005)]

    # @default_guest_list = [Guest.new("Larry", 75.00, 32), Guest.new("Curly", 39.00, 17), Guest.new("Moe", 5.45, 49), Guest.new("Groucho", 200.00, 32), Guest.new("Harpo", 4.00, 16), Guest.new("Chico", 3.45, 19)]
  end

  def test_karaoke_has_name
    assert_equal("The Object-Orientated CodeClan Caraoke", @the_oo_ccc.karaoke_name)
  end

  def test_number_of_rooms
    assert_equal(2, @the_oo_ccc.room.count)
  end

  def test_songs_added_to_room
    @the_oo_ccc.room[0].song_list << Song.new("Barbara Ann", "The Beach Boys", 0001)
    @the_oo_ccc.room[0].song_list << Song.new("Summertime Blues", "Eddie Cochran", 0002)
    assert_equal(2, @the_oo_ccc.room[0].song_list.count)
  end

  def test_guests_added_to_room
    @the_oo_ccc.room[0].guest_list << Guest.new("Larry", 75.00, 32)
    @the_oo_ccc.room[0].guest_list << Guest.new("Curly", 39.00, 17)
    @the_oo_ccc.room[0].guest_list << Guest.new("Moe", 5.45, 49)
    assert_equal(3, @the_oo_ccc.room[0].guest_list.count)
  end

  def test_summarise_event
    @the_oo_ccc.room[0].guest_list << Guest.new("Larry", 75.00, 32)
    @the_oo_ccc.room[0].guest_list << Guest.new("Curly", 39.00, 17)
    @the_oo_ccc.room[0].guest_list << Guest.new("Moe", 5.45, 49)
    @the_oo_ccc.room[0].song_list << Song.new("Barbara Ann", "The Beach Boys", 0001)
    @the_oo_ccc.room[0].song_list << Song.new("Summertime Blues", "Eddie Cochran", 0002)
    assert_equal("You sang in the Blue Room at the The Object-Orientated CodeClan Caraoke.
    Your guests were Larry, Curly, Moe.", @karaoke.summarise_event("The Object-Orientated CodeClan Caraoke", "Blue Room"))
  end

end