class Controller
  attr_reader :user_cards, :dealer_cards
  def initialize
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
  end

  def create_user
    @user = User.new
  end

  def distribution
    @deck.cards.shuffle
    @user.cards = []
    @dealer.cards = []
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @user_cards = @user.cards
    @dealer_cards = @dealer.cards
  end
end
