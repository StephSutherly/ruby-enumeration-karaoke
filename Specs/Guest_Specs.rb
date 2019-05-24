require('minitest/autorun')
require('minitest/rg')
require_relative('../Guest.rb')
require_relative('../Room.rb')
require_relative('../Song.rb')

class TestGuest  < MiniTest::Test

  def setup
    @song1 = Song.new("Personal Jesus", "Depeche Mode")
    @song2 = Song.new("Mardie Bum", "Artic Monkeys")
    @song3 = Song.new("Disturbia", "Rhianna")
    @song4 = Song.new("Into the Groove", "Madonna")
    @song5 = Song.new("Fake Empire", "The National")
    @song6 = Song.new("Uptown Funk", "Mark Ronson")
    @song7 = Song.new("Blue Monday", "New Order")
    @song8 = Song.new("Toxic", "Britney Spears")
    @song9 = Song.new("Shake it Off", "Taylor Swift")

    @guest1 = Guest.new("Alice", 30)
    @guest2 = Guest.new("Ross", 100)
    @guest3 = Guest.new("Matthew", 5)
    @guest4 = Guest.new("Leah", 50)
    @guest5 = Guest.new("Priyanka", 34)
    @guest6 = Guest.new("Marta", 25)
    @guest7 = Guest.new("Evelyn", 400)

    @room1 = Room.new("80's Dance",2, 5, 0, [@song1, @song4], [])
    @room2 = Room.new("Indie and Chill", 4, 4, 16,  [@song2, @song5], [@guest1, @guest2, @guest3, @guest4])
    @room3 = Room.new("Mainstrem Pop", 6, 8, 0, [@song3,], [@guest1, @guest2, @guest3])
  end

  def test_guest_name
    assert_equal("Leah", @guest4.name)
  end

  def test_guest_money
    assert_equal(100, @guest2.wallet)
  end

  def test_pays_money__can_afford
    @guest1.pays_money(@room3)
    assert_equal(22, @guest1.wallet)
  end

  def test_pays_money__cannot_afford
    @guest3.pays_money(@room3)
    assert_equal(5, @guest3.wallet)
  end

  def test_guest_can_afford__true
    result = @guest1.guest_can_afford(@room3)
    assert_equal(true, result)
  end

  def test_guest_can_afford__false
    result = @guest3.guest_can_afford(@room3)
    assert_equal(false, result)
  end

#Not working yet
  def test_pay_entry__can_pay
    @customer7.pay_entry(@room3)
    assert_equal(392, @customer7.wallet)
    assert_equal(32, @room3.till)
  end

end
