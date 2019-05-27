class Guest

attr_reader(:name, :wallet, :fave_song)

  def initialize(name, wallet, fave_song)
    @name = name
    @wallet = wallet
    @fave_song = fave_song
  end

  def pays_money(room)
    if @wallet >= room.price
      @wallet -= room.price
    end
  end

  def guest_can_afford(room)
    if @wallet < room.price
      return false
    else
      return true
    end
  end

#Better to make a pay function that can be adapted to other uses. 
#not working yet
  def pay_entry(room)
    if guest_can_afford(room) == true
      pays_money(room)
      room.increase_till
    end
  end




end
