require('minitest/autorun')
require('minitest/rg')
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

    @guest1 = Guest.new("Alice")
    @guest2 = Guest.new("Ross")
    @guest3 = Guest.new("Matthew")
    @guest4 = Guest.new("Leah")

    @room1 = Room.new("80's Dance", [@song1, @song4], [])
    @room2 = Room.new("Indie and Chill", [@song2, @song5], [@guest1, @guest2, @guest3, @guest4])
    @room3 = Room.new("Mainstrem Pop", [@song3,], [])

  end

  def test_room_name
    assert_equal("Indie and Chill", @room2.name)
  end

  def test_song_playlist
    assert_equal([@song3], @room3.song_playlist)
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest4)
    assert_equal([@guest4], @room1.guests)
  end

#multiple at once
  def test_check_in_guests
    @room1.check_in_guests([@guest4, @guest1])
    assert_equal([@guest4, @guest1], @room1.guests)
  end

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

end
