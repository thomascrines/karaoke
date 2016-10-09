require('minitest/autorun')
require('minitest/rg')
require_relative('../refreshments')

class TestRefreshments < MiniTest::Test

  def setup
    @lager = Refreshments.new("Lager", 3.00, 18)
  end

  def test_refreshments_has_name
    assert_equal("Lager", @lager.refreshments_name)
  end

  def test_refreshments_has_price
    assert_equal(3.00, @lager.refreshments_cost)
  end

  def test_refreshments_has_age_limit
    assert_equal(18, @lager.age_limit)
  end

end