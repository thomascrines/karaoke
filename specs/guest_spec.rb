require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @larry = Guest.new("Larry", 75.00, 32)
  end

  def test_guest_has_name
    assert_equal("Larry", @larry.guest_name)
  end

  def test_guest_has_money
    assert_equal(75.00, @larry.guest_money)
  end

  def test_guest_has_age
    assert_equal(32, @larry.guest_age)
  end

end