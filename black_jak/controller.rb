class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @money = Money.new
    @desk = Desk.new
    @interface = Interface.new
    @user = User.new
  end

  def dealer_cards
    @dealer.cards << @desk.cards.shift(2)
    puts 'Карты дилера:'
    @dealer.cards.map do |card|
      card.map do |item|
        puts '*'
      end
    end
  end

  def start
    @interface.enter_user_name
    @desk.cards.shuffle
    distribution
  end

  def distribution
    @user.cards << @desk.cards.shift(2)
    @dealer.cards << @desk.cards.shift(2)
    @interface.puts_cards(@user.cards)
  end
end
