class Room

attr_reader(:name, :song_playlist, :guests)

  def initialize(name, song_playlist, guests)
    @name = name
    @song_playlist = song_playlist
    @guests = guests
  end

  def check_in_guest(guest)
    @guests << guest
  end

#check in multiple guests at once?
  def check_in_guests(guests)
      # for each guest I want to check in (guests)
      # add the guest I'm on in the loop to the @guests array
      guests.each do |guest|
        @guests << guest
      end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song_to_room(new_song)
    @song_playlist << new_song
  end

  def add_songs_to_room(new_songs)
    new_songs.each do |song|
      @song_playlist << song
    end
  end

end
