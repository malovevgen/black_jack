class Game

  attr_accessor :dealer, :user

  def initialize
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
    @user = User.new    
  end

  def start
    @user.name = 'user_Name'
  end
end
