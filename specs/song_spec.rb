require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @barbara_ann = Song.new("Barbara Ann", "The Beach Boys", 0001)
  end

  def test_song_has_name
    assert_equal(@barbara_ann.title, "Barbara Ann" )
  end

  def test_song_has_artist
    assert_equal(@barbara_ann.artist, "The Beach Boys")
  end

  def test_song_has_number
    assert_equal(@barbara_ann.number, 0001)
  end
  
end