class User < Player
  attr_accessor :name

  def initialize
    super
  end

  def type
    'user'
  end
end
