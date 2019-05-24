require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../Room.rb')
require_relative('../Song.rb')
require_relative('../Guest.rb')

class TestRoom  < MiniTest::Test

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
    @guest3 = Guest.new("Matthew", 15)
    @guest4 = Guest.new("Leah", 50)
    @guest5 = Guest.new("Priyanka", 34)
    @guest6 = Guest.new("Marta", 25)
    @guest7 = Guest.new("Evelyn", 400)

    @room1 = Room.new("80's Dance",2, 5, 0, [@song1, @song4], [])
    @room2 = Room.new("Indie and Chill", 4, 4, 16,  [@song2, @song5], [@guest1, @guest2, @guest3, @guest4])
    @room3 = Room.new("Mainstrem Pop", 6, 8, 0, [@song3,], [@guest1, @guest2, @guest3])

  end

  def test_room_name
    assert_equal("Indie and Chill", @room2.name)
  end

  def test_song_playlist
    assert_equal([@song3], @room3.song_playlist)
  end

  def test_capacity
    assert_equal(2, @room1.capacity)
  end

  def test_room_price
    assert_equal(8, @room3.price)
  end

  def test_till
    assert_equal(16, @room2.till)
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest4)
    assert_equal([@guest4], @room1.guests)
  end

  def test_check_in_guest__refuse_at_capacity
    @room2.check_in_guest(@guest5)
    assert_equal(4, @room2.guests.count)
  end

#multiple at once
  def test_check_in_guests
    @room1.check_in_guests([@guest4, @guest1])
    assert_equal([@guest4, @guest1], @room1.guests)
  end

#multiple at once with capacity
#capacity = 2
#add 3 guests
# << guests.first(2)

  def test_check_in_guests__up_to_capacity
    @room1.check_in_guests([@guest1, @guest3, @guest5])
    assert_equal([@guest1, @guest3], @room1.guests)
  end

#below doesn't work - expected 6, actual 0:
  # def test_check_in_guests__already_busy
  #   @room3.check_in_guests([@guest4, @guest5, @guest6, @guest7])
  #   assert_equal(6, @room1.guests.length)
  # end


  def test_check_out_guest
  @room2.check_out_guest(@guest2)
  assert_equal([@guest1, @guest3, @guest4], @room2.guests)
  end

  def test_add_song_to_room
    expected = [@song1, @song4, @song7]
    assert_equal(expected, @room1.add_song_to_room(@song7))
  end

#multiple at once
  def test_add_songs_to_room
    @room3.add_songs_to_room([@song6, @song8, @song9])
    expected = [@song3, @song6, @song8, @song9]
    assert_equal(expected, @room3.song_playlist)
  end

  def test_increase_till
    @room1.check_in_guests([@guest3, @guest2])
    @room1.increase_till(@room1)
    assert_equal(10, @room1.till)
  end

  def test_total_all_rooms
    grand_total = @room1.till + @room2.till + @room3.till
    assert_equal(16, grand_total)
  end

end

# What happens if there are more guests trying to be checked in than there is free space in the room?////
# Karaoke venues usually have an entry fee - So the guests could have money so they can pay it.
