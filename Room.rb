class Room

attr_reader(:name, :song_playlist, :guests)

  def initialize(name, song_playlist, guests)
    @name = name
    @song_playlist = song_playlist
    @guests = guests
  end

end
