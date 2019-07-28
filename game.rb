class Game
  ACTIONS = { distribution: @distribution, puts_evrithing: @puts_evrithing }.freeze
  attr_accessor :user, :dealer
  attr_reader :status, :actions

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
  end

  def distribution
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @bank.bet_money
    #@status = distributed
    selector
  end

  def selector
    ACTIONS[puts_evrithing]
  end

  def puts_evrithing
    puts "puts_evrithing"
  end
end
