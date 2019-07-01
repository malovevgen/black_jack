class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @money = Money.new
    @desk = Desk.new
    @interface = Interface.new
  end

  def start
    @user = User.new
    @user.name = @interface.enter_user_name
    @interface.greeting
    @desk.cards.shuffle
    distribution
  end

  def distribution
    @user.cards << @desk.cards.shift(2)
    @dealer.cards << @desk.cards.shift(2)
    @interface.puts_user_cards(@user.cards)
    @interface.puts_dealer_cards(@dealer.cards)
  end
end
