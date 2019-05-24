require('minitest/autorun')
require('minitest/rg')
require_relative('../Room.rb')
require_relative('../Song.rb')
require_relative('../Guest.rb')

class TestRoom  < MiniTest::Test

  def setup

    @song1 = Song.new("Personal Jeses", "Depeche Mode")
    @song2 = Song.new("Mardie Bum", "Artic Monkeys")
    @song3 = Song.new("Disturbia", "Rhianna")
    @song4 = Song.new("Into the Groove", "Madonna")
    @song5 = Song.new("Fake Empire", "The National")
    @song6 = Song.new("Uptown Funk", "Mark Ronson")

    @room1 = Room.new("80's Dance", [@song1, @song4], [])
    @room2 = Room.new("Indie and Chill", [@song2, @song5], [])
    @room3 = Room.new("Mainstrem Pop", [@song3, @song6], [])

    @guest1 = Guest.new("Alice")
    @guest2 = Guest.new("Ross")
    @guest3 = Guest.new("Matthew")
    @guest4 = Guest.new("Leah")

  end

  def test_room_name
    assert_equal("Indie and Chill", @room2.name)
  end

  def test_song_playlist
    assert_equal([@song3,@song6], @room3.song_playlist)
  end

end
