class Game
  ACTIONS = { distribution: @distribution, puts_evrithing: @puts_evrithing }.freeze
  attr_accessor :user, :dealer
  attr_reader :status, :actions
  attr_writer :value

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
    @actions = [@distribution]
  end

  def distribution
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @bank.bet_money
    @status = :distributed
    available
  end

  def available
    if @status == :distributed
      if @user.cards.size > 2
        @actions =  [:discover, :dealer_step]
      else
        @actions = [:discover, :dealer_step, :add]
      end
      #(@actions << :add) if @user.cards.size < 3
    else @status == :puts_evrithing
    
  end

  def selector(value)
  end

    #ACTIONS[puts_evrithing]
  end

  def puts_evrithing
    puts 'puts_evrithing'
  end

  def discover
    puts 'discover'
  end

  def dealer_step
    puts 'dealer_step'
  end

  def add
    puts 'add'
  end
end
