require('minitest/autorun')
require('minitest/rg')
require_relative('../Song.rb')
# require_relative('../Guest.rb')
# require_relative('../Room.rb')

class TestSong  < MiniTest::Test

  def setup
    @song1 = Song.new("Personal Jeses", "Depeche Mode")
    @song2 = Song.new("Mardie Bum", "Artic Monkeys")
    @song3 = Song.new("Disturbia", "Rhianna")
    @song4 = Song.new("Into the Groove", "Madonna")
    @song5 = Song.new("Fake Empire", "The National")
    @song6 = Song.new("Uptown Funk", "Mark Ronson")
  end

  def test_song_name
    assert_equal("Mardie Bum", @song2.name)
  end

  def test_artist_name
    assert_equal("Depeche Mode", @song1.artist_name)
  end


end
