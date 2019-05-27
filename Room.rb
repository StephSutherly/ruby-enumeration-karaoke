class Room

attr_reader(:name, :capacity, :price, :till, :song_playlist, :guests)

  def initialize(name, capacity, price, till, song_playlist, guests)
    @name = name
    @capacity = capacity
    @price = price
    @till = till
    @song_playlist = song_playlist
    @guests = guests
  end

  def check_in_guest(guest)
    if @guests.count < capacity
      @guests << guest
    end
  end

#check in multiple guests at once?
# for each guest I want to check in (guests)
# add the guest I'm on in the loop to the @guests array
#how to add multiple guests under capacity.

  def check_in_guests(guests_to_check_in)
    while @guests.length <
    @capacity
      @guests << guests_to_check_in.first
      guests_to_check_in.shift
    end
  end

# First attempt: Doesn't work - [[arry in array]]
  # def check_in_guests(guests)
  #   guests.each do |guest|
  #     @guests << guests.first(@capacity)
  #   end
  # end

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

#Could I also, with a different algorithm, increase_till within check_in_guest?
  def increase_till()
    for guest in @guests
      @till += @price
    end
    return @till
  end


  def fave_song_cheer(guest)
    if @song_playlist.include?(guest.fave_song)
      return "Yeeeey!"
    end
  end

end
