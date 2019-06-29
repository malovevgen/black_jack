class User
  attr_accessor :name, :cards, :points

  def initialize(name)
    @cards = []
    @points = 0
    @name = name
  end

  def type
    @type = 'user'
  end
  # def assign_name(name)
  #   @name = name
  # end
end
