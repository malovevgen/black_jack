class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @bank = Bank.new
    @cards = Cards.new
  end
end
