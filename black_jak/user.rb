class User < Player
  attr_accessor :name

  def initialize
    super
  end

  def type
    @type = 'user'
  end
end
user = User.new
