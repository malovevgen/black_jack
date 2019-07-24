class Interface
  def initialize
    @game = Game.new
  end

  def start
    @game.user.name = 'B'
    puts @game.user.name
    #puts @game.start
  end
end
