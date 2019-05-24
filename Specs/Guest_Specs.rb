require('minitest/autorun')
require('minitest/rg')
require_relative('../Guest.rb')
# require_relative('../Room.rb')
# require_relative('../Song.rb')

class TestGuest  < MiniTest::Test

  def setup
    @guest1 = Guest.new("Alice")
    @guest2 = Guest.new("Ross")
    @guest3 = Guest.new("Matthew")
    @guest4 = Guest.new("Leah")
  end

  def test_guest_name
    assert_equal("Leah", @guest4.name)
  end

end
