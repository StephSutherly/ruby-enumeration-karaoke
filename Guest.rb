class Guest

attr_reader(:name, :wallet)

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
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

#not working yet
  def pay_entry(room)
    if guest_can_afford(room) == true
      pays_money(room)
      room.increase_till
    end
  end




end
