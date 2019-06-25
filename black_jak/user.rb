class User
  attr_accessor :name, :cards, :points

  def initialize
    @cards = []
    @points = 0
  end

  def assign_name(name)
    @name = name
  end
end
