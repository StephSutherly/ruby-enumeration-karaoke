require('minitest/autorun')
require('minitest/rg')
require_relative('../Guest.rb')
# require_relative('../Room.rb')
# require_relative('../Song.rb')

class TestGuest  < MiniTest::Test

  def setup
    @guest1 = Guest.new("Alice", 30)
    @guest2 = Guest.new("Ross", 100)
    @guest3 = Guest.new("Matthew", 15)
    @guest4 = Guest.new("Leah", 50)
  end

  def test_guest_name
    assert_equal("Leah", @guest4.name)
  end

  def test_guest_money
    assert_equal(100, @guest2.wallet)
  end


end
