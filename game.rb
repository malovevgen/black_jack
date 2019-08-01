class Game
  ACTIONS = { distribution: @distribution, discover: @discover, dealer_step: @dealer_step, add: @add }.freeze
  attr_accessor :user, :dealer, :key
  attr_reader :status, :actions
  #attr_writer :value

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

  def selector(key)
    actions = { distribution: @distribution, discover: @discover, dealer_step: @dealer_step, add: @add }
    actions[key]
  end

    #ACTIONS[puts_evrithing]
  end

  def puts_evrithing
    puts 'puts_evrithing'
  end

  def discover
    puts 'you in discover'
  end

  def dealer_step
    puts 'you in dealer_step'
  end

  def add
    puts 'you in add'
  end
end
