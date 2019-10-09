class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      # require "pry"; binding.pry
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def price_per_square_foot
    # (@price / area.to_f).round(2)
    price_per_sf = @price / area.to_f
    price_per_sf.round(2)
  end
end
